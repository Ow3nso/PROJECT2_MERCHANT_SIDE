import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:auth_plugin/src/widgets/buttons/default_auth_btn.dart';
import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:auth_plugin/src/controllers/auth/password_reset.dart';
import 'package:auth_plugin/src/pages/set_new_pass.dart';
import 'package:auth_plugin/src/pages/sign_up.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ResetPasswordPage extends StatefulWidget {
  final String fetchEmail; // Email fetched from the previous page

  ResetPasswordPage({required this.fetchEmail});

  @override
  _ResetPasswordPageState createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage> {
  final TextEditingController _otpController = TextEditingController();
  final passwordResetController = PasswordResetController();
  bool hasError = false;
  String? currentText;
  final formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  final String verificationId = Get.arguments[0]; // Passed from previous page

  int _timeRemaining = 60;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (_timeRemaining > 0) {
        setState(() {
          _timeRemaining--;
        });
      } else {
        timer.cancel();
      }
    });
  }

  void _resendCode() {
    setState(() {
      _timeRemaining = 60; // Reset the timer
      startTimer(); // Restart the timer
    });
  }

  // Verifies the entered OTP
  void verifyOtp(String verificationId, String userOtp) async {
    try {
      PhoneAuthCredential creds = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: userOtp);
      User? user = (await auth.signInWithCredential(creds)).user;
      if (user != null) {
        // Navigate to SetNewPassPage after OTP verification
        Get.to(SetNewPassPage(fetchEmail: widget.fetchEmail));
      }
    } on FirebaseAuthException catch (e) {
      Get.snackbar(
        e.message.toString(),
        "Failed",
        colorText: Colors.white,
      );
    }
  }

  void _login() {
    if (currentText != null) {
      verifyOtp(verificationId, currentText!);
    } else {
      Get.snackbar(
        "Enter 6-Digit code",
        "Failed",
        colorText: Colors.white,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 18.0),
          child: AuthBackButton(
            onPressed: () {
              if (passwordResetController.currentOption == 0) {
                Navigator.pop(context);
                return;
              }
              passwordResetController.currentOption--;
            },
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const StepTitle(title: 'Reset your password'),
            const StepSubTitle(
                subTitle: 'Enter the 6-digit verification code sent to your phone number.'),
            Form(
              key: formKey,
              child: PinCodeTextField(
                textStyle: TextStyle(
                    fontSize: 42,
                    fontWeight: FontWeight.w500,
                    color: hasError
                        ? AuthConstants.textErrorRed
                        : AuthConstants.goodGreen),
                appContext: context,
                pastedTextStyle: TextStyle(
                  color: AuthConstants.goodGreen,
                  fontWeight: FontWeight.bold,
                ),
                length: 6,
                obscureText: false,
                showCursor: false,
                blinkWhenObscuring: true,
                animationType: AnimationType.fade,
                validator: (v) => null,
                pinTheme: PinTheme(
                    borderWidth: 1,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: (size.width / 6) * 0.8,
                    fieldWidth: (size.width / 6) - 20,
                    activeFillColor: Colors.white,
                    inactiveColor: AuthConstants.boarderColor,
                    inactiveFillColor: Colors.white,
                    selectedFillColor: Colors.white,
                    activeColor: hasError
                        ? AuthConstants.textErrorRed
                        : AuthConstants.goodGreen,
                    selectedColor: AuthConstants.boarderColor,
                    errorBorderColor: AuthConstants.boarderErrorRed),
                cursorColor: Colors.black,
                animationDuration: const Duration(milliseconds: 300),
                enableActiveFill: true,
                controller: _otpController,
                keyboardType: TextInputType.number,
                onChanged: (value) {},
                onCompleted: (value) {
                  setState(() {
                    currentText = value;
                  });
                },
                beforeTextPaste: (text) {
                  debugPrint("Allowing to paste $text");
                  return true;
                },
              ),
            ),
            Text(
              'Time remaining: 00:${_timeRemaining.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 30),
            AuthButton(
              color: AuthConstants.buttonBlue,
              label: 'Continue',
              actionDissabledColor: AuthConstants.buttonBlueDissabled,
              onTap: _login,
            ),
            const SizedBox(height: 15),
            AuthButton(
              color: Colors.white,
              label: 'Resend Code',
              textColor: const Color(0xff34303E),
              boarderColor: AuthConstants.boarderColor,
              onTap: _resendCode,
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
