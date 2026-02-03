import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show FirebaseCrashlytics;
import '../backend_factory.dart';

class FirebaseLogger implements Logger {
  final _logger = FirebaseCrashlytics.instance;

  @override
  Future<void> logError(Exception exception, String reason, bool fatal) async {
    return _logger.recordError(exception, null, reason: reason, fatal: fatal);
  }

  @override
  Future<void> logWarn(String error) async {
    return _logger.log(error);
  }
}
