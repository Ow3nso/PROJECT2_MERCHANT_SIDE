import 'dart:async';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import 'package:auth_plugin/src/widgets/buttons/default_auth_btn.dart';
import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:auth_plugin/src/controllers/auth/password_reset.dart';
import 'package:auth_plugin/src/pages/sign_up.dart';
import 'progress_screen.dart';
// import 'package:auth_plugin/src/pages/sign_up.dart';
// import 'package:auth_plugin/src/widgets/pass_reset/phone_email_input_view.dart';
// import 'package:auth_plugin/src/widgets/pass_reset/set_new_pass_view.dart';

// import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart';
// import 'package:auth_plugin/src/controllers/auth/password_reset.dart';

class OtpPage extends StatefulWidget {
  @override
  _OtpPageState createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  final TextEditingController _otpController = TextEditingController();
  final passwordResetController = PasswordResetController();
  bool hasError = false;
  String? currentText;
  final formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  final String verificationId = Get.arguments[0];

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
      _timeRemaining = 60; // Reset timer
      startTimer(); // Restart timer
    });
  }

  final int codeLength = 6;
  @override
  Widget build(BuildContext context) {
    // verify otp
  void verifyOtp(
      String verificationId,
      String userOtp,
      ) async {
        try {
          PhoneAuthCredential creds = PhoneAuthProvider.credential(
              verificationId: verificationId, smsCode: userOtp);
          User? user = (await auth.signInWithCredential(creds)).user;
          if (user != null) {
            context.read<SignUpFlowController>().mockProgress();
            NavigationService.navigate(
              context,
              ProgressScreen.routeName,
            );
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

    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white, // Set the background color to white
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.only(left: 16.0, top: 16.0), 
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 20),
              child: Text(
                'Step 9 of 9',
                style: TextStyle(
                    color: AuthConstants.textErrorRed,
                    fontSize: 14,
                    fontWeight: FontWeight.w600),
              ),
            ),

            const StepTitle(title: 'Enter your code here'),
            const StepSubTitle(
            subTitle:
                'Enter the 6-digit verification code sent to your phone number ending with ...'
            ),

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
                validator: (v) {
                  return null;
                },
                pinTheme: PinTheme(
                    borderWidth: 1,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(8),
                    fieldHeight: (size.width / codeLength) * 0.8,
                    fieldWidth: (size.width / codeLength) - 20,
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
                onChanged: (value) => {},
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
            const SizedBox(
              height: 10,
            ),
            Text(
              'Time remaining: 00:${_timeRemaining.toString().padLeft(2, '0')}',
              style: TextStyle(fontSize: 14),
            ),
            const SizedBox(
              height: 30,
            ),
            AuthButton(
              color: AuthConstants.buttonBlue,
              label: 'Continue',
              actionDissabledColor: AuthConstants.buttonBlueDissabled,
              onTap: _otpController.text.isEmpty || hasError ? null : _login,
            ),
            const SizedBox(
              height: 15,
            ),
            AuthButton(
              color: Colors.white,
              label: 'Resend Code',
              textColor: const Color(0xff34303E),
              boarderColor: AuthConstants.boarderColor,
              // onTap: () {
              //   Navigator.push(
              //     context,
              //     MaterialPageRoute(builder: (context) => SetNewPassView(passwordResetController: PasswordResetController,)),
              //   );
              // },
            ),
          ],
        ),
      ),
    );
  }
}
