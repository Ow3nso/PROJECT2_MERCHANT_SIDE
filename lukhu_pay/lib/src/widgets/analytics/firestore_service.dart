import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:convert';
// import 'package:uuid/uuid.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart' hide DateUtils;
import 'package:intl/intl.dart';
import '../analytics/date_utils.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
    AccountType,
    CartController,
    // AppBarType,
    // BlurDialogBody,
    // DefaultBackButton,
    Helpers,
    // LuhkuAppBar,
    // MpesaFields,
    UserRepository,
    // NavigationService,
    ReadContext,
    // ShortMessageType,
    ShortMessages,
    // StyleColors,
    WatchContext;

class FirestoreService {
  static final FirebaseFirestore firestore = FirebaseFirestore.instance;

  static Future<Map<String, dynamic>> fetchIncomeOverview(BuildContext context, String period) async {
    DateTime startDate = DateUtils.getStartDate(period);
    DateTime endDate = DateTime.now();

    // Fetch current period data
    final userId = context
        .read<UserRepository>()
        .fbUser
        ?.uid;
    QuerySnapshot snapshot = await firestore
        .collection("mytransactions")
        .where("status", isEqualTo: "COMPLETE")
        .where("userId", isEqualTo: userId)
        .get();

    // Fetch previous period data for comparison
    DateTime comparisonStartDate;
    if (period == "today") {
      comparisonStartDate = DateUtils.getStartDate("yesterday");
    } else if (period == "yesterday") {
      comparisonStartDate = DateUtils.getStartDate("day_before_yesterday");
    } else if (period == "last_7_days") {
      comparisonStartDate = DateUtils.getStartDate("previous_7_days");
    } else if (period == "last_30_days") {
      comparisonStartDate = DateUtils.getStartDate("previous_30_days");
    } else if (period == "last_6_months") {
      comparisonStartDate = DateUtils.getStartDate("previous_6_months");
    } else if (period == "last_1_year") {
      comparisonStartDate = DateUtils.getStartDate("previous_1_year");
    } else {
      comparisonStartDate = startDate.subtract(Duration(days: 1));
    }

    // Process current period data
    Map<String, dynamic> currentData = await _processData(snapshot, startDate, endDate, period);
    
    // Process comparison period data
    Map<String, dynamic> previousData = await _processData(
      snapshot, 
      comparisonStartDate, 
      startDate.subtract(Duration(seconds: 1)), 
      period
    );

    // Calculate percentage changes with explicit type conversion
    double incomeChange = _calculatePercentageChange(
      (previousData["totalIncome"] as num).toDouble(), 
      (currentData["totalIncome"] as num).toDouble()
    );
    double expensesChange = _calculatePercentageChange(
      (previousData["totalExpenses"] as num).toDouble(), 
      (currentData["totalExpenses"] as num).toDouble()
    );
    double netIncomeChange = _calculatePercentageChange(
      (previousData["netIncome"] as num).toDouble(), 
      (currentData["netIncome"] as num).toDouble()
    );
    double topupsChange = _calculatePercentageChange(
      (previousData["totalTopups"] as num).toDouble(), 
      (currentData["totalTopups"] as num).toDouble()
    );
    double withdrawalsChange = _calculatePercentageChange(
      (previousData["totalWithdrawals"] as num).toDouble(), 
      (currentData["totalWithdrawals"] as num).toDouble()
    );

    return {
      "totalIncome": currentData["totalIncome"],
      "totalExpenses": currentData["totalExpenses"],
      "netIncome": currentData["netIncome"],
      "totalTopups": currentData["totalTopups"],
      "totalWithdrawals": currentData["totalWithdrawals"],
      "groupedData": _ensureCompleteData(currentData["groupedData"], period, startDate),
      "minAmount": currentData["minAmount"],
      "maxAmount": currentData["maxAmount"],
      "percentageChanges": {
        "income": incomeChange,
        "expenses": expensesChange,
        "netIncome": netIncomeChange,
        "topups": topupsChange,
        "withdrawals": withdrawalsChange,
      }
    };
  }

  static Map<String, double> _ensureCompleteData(Map<String, double> originalData, String period, DateTime startDate) {
    Map<String, double> completeData = {};
    
    if (period == "today" || period == "yesterday") {
      // Ensure all hours from 00:00 to 23:00 are present
      for (int i = 0; i < 24; i++) {
        String hour = i.toString().padLeft(2, '0') + ':00';
        completeData[hour] = originalData[hour] ?? 0.0;
      }
    } 
    else if (period == "last_7_days") {
      // Ensure all 7 days of week are present in order
      List<String> days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
      for (String day in days) {
        completeData[day] = originalData[day] ?? 0.0;
      }
    } 
    else if (period == "last_30_days") {
      // Group by weeks and ensure all weeks are present
      int totalWeeks = 5; // 30 days = ~4.3 weeks, rounded to 5
      for (int week = 1; week <= totalWeeks; week++) {
        String weekKey = "Week $week";
        completeData[weekKey] = originalData[weekKey] ?? 0.0;
      }
    } 
    else if (period == "last_6_months") {
      // Ensure all 6 months are present in order
      DateTime now = DateTime.now();
      for (int i = 5; i >= 0; i--) {
        DateTime month = DateTime(now.year, now.month - i, 1);
        String monthKey = DateFormat("MMM").format(month);
        completeData[monthKey] = originalData[monthKey] ?? 0.0;
      }
    } 
    else if (period == "last_1_year") {
      // Ensure all 12 months are present in order
      DateTime now = DateTime.now();
      for (int i = 11; i >= 0; i--) {
        DateTime month = DateTime(now.year, now.month - i, 1);
        String monthKey = DateFormat("MMM").format(month);
        completeData[monthKey] = originalData[monthKey] ?? 0.0;
      }
    } 
    else {
      completeData = originalData;
    }
    
    return completeData;
  }

  static Future<Map<String, dynamic>> _processData(
    QuerySnapshot snapshot, 
    DateTime startDate, 
    DateTime endDate,
    String period
  ) async {
    double totalIncome = 0, totalExpenses = 0;
    double totalTopups = 0, totalWithdrawals = 0;
    Map<String, double> groupedData = {};
    double minAmount = double.infinity;
    double maxAmount = double.negativeInfinity;

    for (var doc in snapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      DateTime createdAt = (data["createdAt"] is Timestamp)
          ? (data["createdAt"] as Timestamp).toDate()
          : DateFormat("MMMM d, yyyy 'at' HH:mm:ss").parse(data["createdAt"]);

      if (createdAt.isAfter(startDate) && createdAt.isBefore(endDate)) {
        double amount = (data["amount"] as num).toDouble();
        String description = data["description"] ?? "";

        String groupKey;
        if (period == "today" || period == "yesterday") {
          groupKey = DateFormat("HH:00").format(createdAt); // Group by hour (00:00 to 23:00)
        } else if (period == "last_7_days") {
          groupKey = DateFormat("E").format(createdAt); // Group by short day name (Mon, Tue, etc.)
        } else if (period == "last_30_days") {
          int weekNumber = ((createdAt.difference(startDate).inDays) / 7).floor() + 1;
          groupKey = "Week $weekNumber"; // Group by week number (Week 1 to Week 5)
        } else if (period == "last_6_months" || period == "last_1_year") {
          groupKey = DateFormat("MMM").format(createdAt); // Group by month abbreviation (Jan, Feb, etc.)
        } else {
          groupKey = DateFormat("yyyy-MM-dd").format(createdAt); // Default to day
        }

        if (description == "Bought Item" || description == "Top Up") {
          totalIncome += amount;
          groupedData[groupKey] = (groupedData[groupKey] ?? 0) + amount;
          if (description == "Top Up") {
            totalTopups += amount;
          }
        } else if (description == "withdrawal") {
          totalExpenses += amount;
          groupedData[groupKey] = (groupedData[groupKey] ?? 0) - amount;
          totalWithdrawals += amount;
        }

        // Update min and max values
        if (amount > maxAmount) maxAmount = amount;
        if (amount < minAmount) minAmount = amount;
      }
    }

    double netIncome = totalIncome - totalExpenses;

    return {
      "totalIncome": totalIncome,
      "totalExpenses": totalExpenses,
      "netIncome": netIncome,
      "totalTopups": totalTopups,
      "totalWithdrawals": totalWithdrawals,
      "groupedData": groupedData,
      "minAmount": minAmount == double.infinity ? 0 : minAmount,
      "maxAmount": maxAmount == double.negativeInfinity ? 0 : maxAmount,
    };
  }

  static double _calculatePercentageChange(double previousValue, double currentValue) {
    if (previousValue == 0) {
      return currentValue == 0 ? 0 : 100.0; // Handle division by zero
    }
    return ((currentValue - previousValue) / previousValue.abs()) * 100;
  }
}
