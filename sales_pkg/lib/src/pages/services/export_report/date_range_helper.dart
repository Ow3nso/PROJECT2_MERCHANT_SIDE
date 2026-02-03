import 'package:intl/intl.dart';

enum DateFilter {
  today,
  yesterday,
  thisWeek,
  last7Days,
  last30Days,
  last6Months,
  last1Year,
  custom
}

class DateRangeHelper {
  static Map<String, DateTime> getDateRange(DateFilter filter, {DateTime? startDate, DateTime? endDate}) {
    DateTime now = DateTime.now();
    DateTime start, end;

    switch (filter) {
      case DateFilter.today:
        start = DateTime(now.year, now.month, now.day);
        end = now;
        break;
      case DateFilter.yesterday:
        start = DateTime(now.year, now.month, now.day).subtract(Duration(days: 1));
        end = DateTime(now.year, now.month, now.day).subtract(Duration(seconds: 1));
        break;
      case DateFilter.thisWeek:
        start = now.subtract(Duration(days: now.weekday - 1));
        end = now;
        break;
      case DateFilter.last7Days:
        start = now.subtract(Duration(days: 7));
        end = now;
        break;
      case DateFilter.last30Days:
        start = now.subtract(Duration(days: 30));
        end = now;
        break;
      case DateFilter.last6Months:
        start = DateTime(now.year, now.month - 6, now.day);
        end = now;
        break;
      case DateFilter.last1Year:
        start = DateTime(now.year - 1, now.month, now.day);
        end = now;
        break;
      case DateFilter.custom:
        start = startDate ?? now;
        end = endDate ?? now;
        break;
    }
    
    return {
      "start": start,
      "end": end,
    };
  }
}
