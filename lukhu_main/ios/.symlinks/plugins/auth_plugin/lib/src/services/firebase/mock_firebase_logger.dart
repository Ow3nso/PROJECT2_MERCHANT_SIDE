import 'dart:developer';

import '../backend_factory.dart';

class MockLogger implements Logger {
  @override
  Future<void> logError(Exception error, String reason, bool fatal) async {
    log(error.toString());
  }

  @override
  Future<void> logWarn(String error) async {
    log(error);
  }
}
