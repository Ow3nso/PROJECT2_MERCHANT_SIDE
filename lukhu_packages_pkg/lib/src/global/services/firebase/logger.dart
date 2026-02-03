import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class Logger{
  final _logger = FirebaseCrashlytics.instance;

  Future<void> logError(Exception exception, String reason, bool fatal) async {
    return _logger.recordError(exception, null, reason: reason, fatal: fatal);
  }

  Future<void> logWarn(String error) async {
    return _logger.log(error);
  }
}