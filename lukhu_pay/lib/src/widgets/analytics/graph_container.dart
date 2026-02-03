import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultDropdown, DiscountCard, ReadContext, StyleColors;
import 'package:lukhu_pay/util/app_util.dart';
import 'package:provider/provider.dart';

import '../../controller/analytics_controller.dart';
import '../drop_down_tile.dart';
import '../analytics/income_chart.dart';
import '../analytics/firestore_service.dart';

class GraphContainer extends StatefulWidget {
  const GraphContainer({super.key, this.child});

  final Widget? child;

  @override
  State<GraphContainer> createState() => _GraphContainerState();
}

class _GraphContainerState extends State<GraphContainer> {
  String selectedPeriod = "last_7_days";
  Map<String, double> groupedData = {};
  double totalIncome = 0, totalExpenses = 0, netIncome = 0;
  double minAmount = 0, maxAmount = 0;
  bool isLoading = true;
  Map<String, double> percentageChanges = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    setState(() => isLoading = true);
    try {
      var result = await FirestoreService.fetchIncomeOverview(context, selectedPeriod);
      setState(() {
        totalIncome = (result["totalIncome"] as num).toDouble();
        totalExpenses = (result["totalExpenses"] as num).toDouble();
        netIncome = (result["netIncome"] as num).toDouble();
        groupedData = Map<String, double>.from(result["groupedData"]);
        minAmount = (result["minAmount"] as num).toDouble();
        maxAmount = (result["maxAmount"] as num).toDouble();
        percentageChanges = Map<String, double>.from(result["percentageChanges"]);
        isLoading = false;
      });
    } catch (e) {
      setState(() => isLoading = false);
      debugPrint('Error fetching transaction data: $e');
    }
  }

  String getComparisonText() {
    if (percentageChanges.isEmpty) return 'Loading...';
    
    final netChange = percentageChanges["netIncome"] ?? 0;
    final arrow = netChange >= 0 ? AppUtil.arrowUp : AppUtil.arrowDown;
    
    String periodText;
    switch (selectedPeriod) {
      case "today":
        periodText = "Yesterday";
        break;
      case "yesterday":
        periodText = "Day Before";
        break;
      case "last_7_days":
      case "previous_7_days":
        periodText = "Last Week";
        break;
      case "last_30_days":
      case "previous_30_days":
        periodText = "Last Month";
        break;
      case "last_6_months":
      case "previous_6_months":
        periodText = "Last 6 Months";
        break;
      case "last_1_year":
      case "previous_1_year":
        periodText = "Last Year";
        break;
      default:
        periodText = "Previous Period";
    }
    
    return '${netChange.toStringAsFixed(2)}% vs $periodText';
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'Income Overview',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.scrim,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
              ),
              SizedBox(
                height: 35,
                child: DefaultDropdown(
                  radius: 8,
                  itemChild: (value) => DropdownTitle(
                    iconData: Icons.calendar_month,
                    title: value,
                    color: StyleColors.lukhuDark1,
                  ),
                  onChanged: (value) async {
                    if (value != null) {
                      setState(() => selectedPeriod = value);
                      await fetchData();
                    }
                  },
                  hintWidget: DropdownTitle(
                    iconData: Icons.calendar_month,
                    title: selectedPeriod.replaceAll('_', ' '),
                    color: StyleColors.lukhuDark1,
                  ),
                  items: context.read<AnalyticsController>().durations,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 32, bottom: 16),
            child: SizedBox(
              height: 300,
              child: isLoading
                  ? Center(child: CircularProgressIndicator())
                  : IncomeChart(
                      groupedData: groupedData,
                      period: selectedPeriod,
                    ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: SizedBox(
              width: 150,
              child: DiscountCard(
                color: (percentageChanges["netIncome"] ?? 0) >= 0 
                    ? Colors.green.shade100
                    : Colors.red.shade100,
                iconImage: (percentageChanges["netIncome"] ?? 0) >= 0 
                    ? AppUtil.arrowUp
                    : AppUtil.arrowDown,
                packageName: AppUtil.packageName,
                description: getComparisonText(),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.scrim,
                  fontWeight: FontWeight.w600,
                  fontSize: 10,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
