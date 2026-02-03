// import 'package:flutter/material.dart';
// import 'package:lukhu_pay/util/app_util.dart';

// class AnalyticsController extends ChangeNotifier {
//   List<String> durations = [
//     'Today',
//     'Yesterday',
//     'This Week',
//     'Last 7 Days',
//     'Last 30 Days',
//     'Last 6 Months',
//     'Last 1 Year',
//     'Custom Date Range'
//   ];

//   String _selectedDuration = 'This Week';
//   String get selectedDuration => _selectedDuration;

//   set selectedDuration(String value) {
//     _selectedDuration = value;
//     notifyListeners();
//   }

//   List<Map<String, dynamic>> summaryList = AppUtil.summaryList;
// }

import 'package:flutter/material.dart';
import 'package:lukhu_pay/util/app_util.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../services/transactions/api_config.dart';

class AnalyticsController with ChangeNotifier {
  String selectedDuration = 'today';
  List<Map<String, dynamic>> summaryList = AppUtil.summaryList;
  List<String> durations = [
    'today',
    'yesterday',
    'last_7_days',
    'last_30_days',
    'last_6_months',
    'last_1_year',
  ];

  List<double> availableBalance = [];
  List<double> pendingBalance = [];
  List<double> withdrawals = [];
  List<double> topUps = [];
  double percentageChange = 0.0;

  Future<void> fetchIncomeOverview(BuildContext context) async {
    try {
      // Dummy data
      final Map<String, dynamic> dummyData = {
        'income_overview': 500.0,
        'income_comparison': "10.5% higher than last period",
        'chart_data': {
          'type': 'daily',
          'data': {
            '0': {'available': 100.0, 'pending': 20.0, 'topups': 120.0, 'withdrawals': 50.0},
            '1': {'available': 200.0, 'pending': 10.0, 'topups': 150.0, 'withdrawals': 80.0},
            '2': {'available': 150.0, 'pending': 15.0, 'topups': 130.0, 'withdrawals': 60.0},
            '3': {'available': 250.0, 'pending': 25.0, 'topups': 180.0, 'withdrawals': 90.0},
            '4': {'available': 300.0, 'pending': 30.0, 'topups': 200.0, 'withdrawals': 100.0},
            '5': {'available': 180.0, 'pending': 12.0, 'topups': 140.0, 'withdrawals': 70.0},
            '6': {'available': 220.0, 'pending': 18.0, 'topups': 160.0, 'withdrawals': 85.0},
          }
        },
        'start_date': '2024-09-01',
        'end_date': '2024-09-07',
        'available_balance': 2000.0,
        'pending_balance': 130.0,
        'total_topups': 980.0,
        'total_withdrawals': 535.0
      };

      // Ensure type safety by explicitly casting the values
      final Map<String, dynamic> chartData =
          dummyData['chart_data']['data'] as Map<String, dynamic>;

      availableBalance = chartData.values
          .map<double>((e) => (e as Map<String, dynamic>)['available'] as double)
          .toList();
      pendingBalance = chartData.values
          .map<double>((e) => (e as Map<String, dynamic>)['pending'] as double)
          .toList();
      withdrawals = chartData.values
          .map<double>((e) => (e as Map<String, dynamic>)['withdrawals'] as double)
          .toList();
      topUps = chartData.values
          .map<double>((e) => (e as Map<String, dynamic>)['topups'] as double)
          .toList();

      // Calculate percentage change (example logic)
      if (availableBalance.isNotEmpty && pendingBalance.isNotEmpty) {
        final lastWeekIncome = availableBalance.last + pendingBalance.last;
        final thisWeekIncome = availableBalance.first + pendingBalance.first;
        percentageChange = ((thisWeekIncome - lastWeekIncome) / lastWeekIncome) * 100;
      }

      // Notify listeners to update the UI
      notifyListeners();
    } catch (e) {
      print('Error fetching income overview: $e');
    }
  }
}
