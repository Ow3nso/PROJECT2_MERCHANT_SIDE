import 'dart:async';

import 'package:flutter/material.dart';

class PasswordResetController with ChangeNotifier {
  final TextEditingController _emailPhoneController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  String _error = '';
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _emailPhoneHasError = false;
  int _currentOption = 0;
  String? _otpCode;
  int _timeRemainderToEnableOTP = 60;
  Timer? _timer;
  bool _resendOtp = false;
  bool get emailPhoneHasError => _emailPhoneHasError;
  int get timeRemainderToEnableOTP => _timeRemainderToEnableOTP;
  int get currentOption => _currentOption;
  bool get resendOtp => _resendOtp;
  String? get otpCode => _otpCode;
  String get error => _error;
  TextEditingController get passwordController => _passwordController;
  TextEditingController get confirmPasswordController =>
      _confirmPasswordController;

  TextEditingController get emailPhoneController => _emailPhoneController;
  set currentOption(int value) {
    _currentOption = value;
    notifyListeners();
  }

  set emailPhoneHasError(bool value) {
    _emailPhoneHasError = value;
    notifyListeners();
  }

  set resendOtp(bool value) {
    _resendOtp = value;
    notifyListeners();
  }

  set timeRemainderToEnableOTP(int value) {
    _timeRemainderToEnableOTP = value;
    notifyListeners();
  }

  set otpCode(String? value) {
    _otpCode = value;
    notifyListeners();
  }

  void startOTPresendTimer() {
    _timer = Timer.periodic(
        const Duration(seconds: 1),
        (t) => {
              if (timeRemainderToEnableOTP == 0)
                {
                  resendOtp = true,
                  t.cancel(),
                }
              else
                {timeRemainderToEnableOTP--}
            });
  }

  set error(String value) {
    _error = value;
    notifyListeners();
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
  }
}
