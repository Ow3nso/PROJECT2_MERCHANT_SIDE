import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Timestamp;

class DateUtils {
  // convert a DateTime (used by flutter_firebase_starter)
  // to a TimeStamp (used by firestore)
  static Timestamp? dateTimeToTimestamp(DateTime? datetime) =>
      Timestamp.fromDate(datetime ?? DateTime.now());
  // convert a TimeStamp (used by firestore)
  // to a DateTime (used by flutter_firebase_starter)
  static DateTime? timestampToDateTime(Timestamp? timestamp) =>
      (timestamp != null)
          ? DateTime.fromMillisecondsSinceEpoch(
              timestamp.millisecondsSinceEpoch,
              isUtc: true)
          : DateTime.now();
}
