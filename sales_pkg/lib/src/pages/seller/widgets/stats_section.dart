import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/services.dart' show rootBundle;
import 'package:pdf/pdf.dart';
import 'package:path_provider/path_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart'; // For DateFormat

import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultDropdown, ReadContext, StyleColors, WatchContext;
import 'package:sales_pkg/src/pages/seller/widgets/stats_card.dart';

import '../../../controllers/sell_view_controller.dart';
import '../../../widgets/drop_down_tile.dart';
import '../../../pages/services/export_report/date_range_helper.dart';
import '../../../pages/services/export_report/export_service.dart';


class StatsSection extends StatelessWidget {
  const StatsSection({super.key});

  Future<List<List<dynamic>>> _fetchData(BuildContext context, DateTime start, DateTime end) async {
    try {
      final sellViewController = context.read<SellViewController>();
      String selectedDuration = sellViewController.statDuration ?? "This Week";

      // First filter by status only (no composite index needed)
      QuerySnapshot snapshot = await FirebaseFirestore.instance
          .collection("mytransactions")
          .where("status", isEqualTo: "COMPLETE")
          // .where("createdAt", isGreaterThanOrEqualTo: start)
          // .where("createdAt", isLessThanOrEqualTo: end)
          .get();

      // Then filter by date in memory
      List<QueryDocumentSnapshot> filteredDocs = snapshot.docs.where((doc) {
        Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
        DateTime createdAt = (data["createdAt"] is Timestamp)
            ? (data["createdAt"] as Timestamp).toDate()
            : DateFormat("MMMM d, yyyy 'at' HH:mm:ss").parse(data["createdAt"]);
        return createdAt.isAfter(start) && createdAt.isBefore(end);
      }).toList();

      // Prepare report data
      List<List<dynamic>> reportData = [
        ["Date", "Description", "Amount", "Status", "Type"]
      ];

      for (var doc in filteredDocs) {
        Map<String, dynamic> transaction = doc.data() as Map<String, dynamic>;
        DateTime createdAt = (transaction["createdAt"] is Timestamp)
            ? (transaction["createdAt"] as Timestamp).toDate()
            : DateFormat("MMMM d, yyyy 'at' HH:mm:ss").parse(transaction["createdAt"]);

        reportData.add([
          DateFormat('yyyy-MM-dd HH:mm').format(createdAt),
          transaction["description"] ?? "",
          transaction["amount"]?.toString() ?? "0",
          transaction["status"] ?? "COMPLETE",
          transaction["type"] ?? "",
        ]);
      }

      if (reportData.length == 1) {
        reportData.add(["No transactions found for selected period", "", "", "", ""]);
      }

      return reportData;
    } catch (e) {
      debugPrint("Error fetching data: $e");
      return [
        ["Error", "Could not fetch data", "Please try again later", "", ""]
      ];
    }
  }

  DateFilter _mapDurationToFilter(String duration) {
    switch (duration) {
      case "Today":
        return DateFilter.today;
      case "Yesterday":
        return DateFilter.yesterday;
      case "This Week":
        return DateFilter.thisWeek;
      case "Last 7 Days":
        return DateFilter.last7Days;
      case "Last 30 Days":
        return DateFilter.last30Days;
      case "Last 6 Months":
        return DateFilter.last6Months;
      case "Last 1 Year":
        return DateFilter.last1Year;
      default:
        return DateFilter.thisWeek;
    }
  }

  Future<void> _exportReport(BuildContext context) async {
    final sellViewController = context.read<SellViewController>();
    String selectedDuration = sellViewController.statDuration ?? "This Week";

    DateFilter filter = _mapDurationToFilter(selectedDuration);
    var dateRange = DateRangeHelper.getDateRange(filter);
    
    List<List<dynamic>> reportData = await _fetchData(context, dateRange['start']!, dateRange['end']!);

    if (reportData.isNotEmpty) {
      try {
        final pdf = pw.Document();
        final font = pw.Font.helvetica();
        final boldFont = pw.Font.helveticaBold();
        
        pdf.addPage(
          pw.MultiPage(
            pageFormat: PdfPageFormat.a4,
            margin: pw.EdgeInsets.all(20),
            build: (pw.Context context) => [
              pw.Row(children: [pw.Text('Sales Report', style: pw.TextStyle(font: boldFont, fontSize: 24))]),
              pw.SizedBox(height: 20),
              pw.Text('Period: $selectedDuration', style: pw.TextStyle(font: boldFont, fontSize: 16)),
              pw.Text('${DateFormat('MMM dd, yyyy').format(dateRange['start']!)} - ${DateFormat('MMM dd, yyyy').format(dateRange['end']!)}'),
              pw.SizedBox(height: 30),
              pw.Table.fromTextArray(
                context: context,
                columnWidths: {0: pw.FlexColumnWidth(3), 1: pw.FlexColumnWidth(4), 2: pw.FlexColumnWidth(2), 3: pw.FlexColumnWidth(2), 4: pw.FlexColumnWidth(2)},
                data: reportData,
                headerStyle: pw.TextStyle(font: boldFont),
                cellStyle: pw.TextStyle(font: font),
                headerDecoration: pw.BoxDecoration(color: PdfColor.fromHex('#F5F5F5')),
                cellPadding: pw.EdgeInsets.all(8),
                border: pw.TableBorder.all(color: PdfColor.fromHex('#E0E0E0'), width: 1),
              ),
              pw.SizedBox(height: 30),
              pw.Align(
                alignment: pw.Alignment.centerRight,
                child: pw.Text('Generated on ${DateFormat('MMM dd, yyyy').format(DateTime.now())}'),
              ),
            ],
          ),
        );

        final directory = await getTemporaryDirectory();
        final pdfFile = File('${directory.path}/report_${DateTime.now().millisecondsSinceEpoch}.pdf');
        await pdfFile.writeAsBytes(await pdf.save());

        if (await pdfFile.exists()) {
          await Share.shareXFiles(
            [XFile(pdfFile.path)],
            subject: 'Sales Report - $selectedDuration',
          );
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Report shared successfully!")));
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error generating PDF: ${e.toString()}")));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("No data found for the selected period.")));
    }
  }

  @override
  Widget build(BuildContext context) {
    var sellerStats = context.read<SellViewController>().sellerStats;

    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: StyleColors.lukhuWhite),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: 35,
                child: DefaultDropdown(
                  radius: 8,
                  itemChild: (value) => DropdownTitle(
                    iconData: Icons.calendar_month,
                    title: value,
                    color: StyleColors.lukhuDark1,
                  ),
                  onChanged: (value) => context.read<SellViewController>().statDuration = value,
                  hintWidget: DropdownTitle(
                    iconData: Icons.calendar_month,
                    title: context.watch<SellViewController>().statDuration ?? "This Week",
                    color: StyleColors.lukhuDark1,
                  ),
                  items: context.read<SellViewController>().durations,
                ),
              ),
              InkWell(
                onTap: () => _exportReport(context),
                child: const Text(
                  'Export Report',
                  style: TextStyle(color: Color(0xFF1433fc), fontWeight: FontWeight.bold),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: List.generate(
                sellerStats.length,
                (index) => Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: StatsCard(data: sellerStats[index]),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
