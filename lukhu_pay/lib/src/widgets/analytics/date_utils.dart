import 'package:flutter/material.dart';

class DateUtils {
  static DateTime getStartDate(String period) {
    DateTime now = DateTime.now();
    switch (period) {
      case "today":
        return DateTime(now.year, now.month, now.day);
      case "yesterday":
        return DateTime(now.year, now.month, now.day).subtract(Duration(days: 1));
      case "last_7_days":
        return now.subtract(Duration(days: 7));
      case "last_30_days":
        return now.subtract(Duration(days: 30));
      case "last_6_months":
        return DateTime(now.year, now.month - 6, now.day);
      case "last_1_year":
        return DateTime(now.year - 1, now.month, now.day);
      default:
        return now;
    }
  }
}
