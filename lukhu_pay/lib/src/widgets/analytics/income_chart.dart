import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class IncomeChart extends StatelessWidget {
  final Map<String, double> groupedData;
  final String period;

  IncomeChart({
    required this.groupedData,
    required this.period,
  });

  @override
  Widget build(BuildContext context) {
    List<FlSpot> spots = [];
    List<String> labels = groupedData.keys.toList();

    // Sort labels based on period
    if (period == "today" || period == "yesterday") {
      labels.sort((a, b) => a.compareTo(b)); // Sort hours chronologically
    } else if (period == "last_7_days") {
      // Sort by day of week
      final dayOrder = ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'];
      labels.sort((a, b) => dayOrder.indexOf(a.substring(0, 3)).compareTo(dayOrder.indexOf(b.substring(0, 3))));
    } else if (period == "last_30_days") {
      // Sort by week number
      labels.sort((a, b) => int.parse(a.split(' ')[1]).compareTo(int.parse(b.split(' ')[1])));
    } else if (period == "last_6_months" || period == "last_1_year") {
      // Sort by month
      final monthOrder = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
      labels.sort((a, b) => monthOrder.indexOf(a).compareTo(monthOrder.indexOf(b)));
    } else {
      labels.sort(); // Default sort
    }

    for (int i = 0; i < labels.length; i++) {
      spots.add(FlSpot(i.toDouble(), groupedData[labels[i]] ?? 0));
    }

    // Determine min and max values dynamically
    double minAmount = groupedData.values.isEmpty ? 0 : groupedData.values.reduce((a, b) => a < b ? a : b);
    double maxAmount = groupedData.values.isEmpty ? 0 : groupedData.values.reduce((a, b) => a > b ? a : b);

    // Ensure the min and max have some padding
    double padding = (maxAmount - minAmount) * 0.1;
    if (padding == 0) padding = 1; // Prevent zero padding
    double minY = minAmount - padding;
    double maxY = maxAmount + padding;

    // Calculate appropriate interval for left titles
    double interval = ((maxY - minY) / 5).ceilToDouble();
    if (interval <= 0) interval = 1;

    return Container(
      height: 300,
      padding: EdgeInsets.all(10),
      child: LineChart(
        LineChartData(
          minY: minY,
          maxY: maxY,
          titlesData: FlTitlesData(
            topTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Hide top values
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(showTitles: false), // Hide right values
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                getTitlesWidget: (value, meta) {
                  if (value.toInt() >= 0 && value.toInt() < labels.length) {
                    return Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Text(
                        labels[value.toInt()],
                        style: TextStyle(fontSize: 10),
                      ),
                    );
                  }
                  return Text('');
                },
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: interval,
                getTitlesWidget: (value, meta) {
                  return Text(
                    value.toInt().toString(),
                    style: TextStyle(fontSize: 10),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border(
              left: BorderSide(color: Colors.black, width: 1), // Show only left border
              bottom: BorderSide(color: Colors.black, width: 1), // Show bottom border
            ),
          ),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: Colors.blue,
              belowBarData: BarAreaData(show: true, color: Colors.blue.withOpacity(0.3)),
            ),
          ],
        ),
      ),
    );
  }
}
