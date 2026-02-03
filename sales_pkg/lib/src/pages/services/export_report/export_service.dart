import 'dart:io';
import 'package:csv/csv.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:share_plus/share_plus.dart'; // Add this import

class ExportService {
  static Future<void> exportToCSV(List<List<dynamic>> data) async {
    String csvData = const ListToCsvConverter().convert(data);
    
    final path = await _getUniqueFilePath("DukastaxReport", "csv");
    final file = File(path);
    await file.writeAsString(csvData);

    print("CSV saved at: $path");

    // Share the file via email/apps
    await _shareFile(path, "CSV Report");
  }

  static Future<void> exportToPDF(List<List<String>> data) async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Table.fromTextArray(
          context: context,
          data: data,
        ),
      ),
    );

    final path = await _getUniqueFilePath("DukastaxReport", "pdf");
    final file = File(path);
    await file.writeAsBytes(await pdf.save());

    print("PDF saved at: $path");

    // Share the file via email/apps
    await _shareFile(path, "PDF Report");
  }

  // Helper to share the file
  static Future<void> _shareFile(String filePath, String subject) async {
    final file = XFile(filePath);
    await Share.shareXFiles(
      [file],
      subject: subject,
      text: "Attached is your Dukastax report.",
    );
  }

  // Existing helper to generate unique filenames
  static Future<String> _getUniqueFilePath(String baseName, String extension) async {
    final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    String dateStr = dateFormat.format(DateTime.now());
    String directoryPath = "/storage/emulated/0/Download/";
    int counter = 0;
    String filePath;

    while (true) {
      String fileName;
      if (counter == 0) {
        fileName = '$baseName$dateStr';
      } else {
        fileName = '$baseName($counter)$dateStr';
      }
      filePath = '$directoryPath$fileName.$extension';
      final file = File(filePath);
      bool exists = await file.exists();
      if (!exists) {
        break;
      }
      counter++;
    }

    return filePath;
  }
}