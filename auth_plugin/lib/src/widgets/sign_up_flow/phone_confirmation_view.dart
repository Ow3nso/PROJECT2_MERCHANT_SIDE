import 'package:auth_plugin/src/controllers/auth/password_reset.dart';
import 'package:auth_plugin/src/widgets/pass_reset/set_new_pass_view.dart';
import 'package:get/get.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show IntExtension, StringExtension;

import 'package:auth_plugin/src/widgets/sign_up_flow/user_account_type.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/otp_controller.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/add_phone_number_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AnimationType, PinCodeFieldShape, PinCodeTextField, PinTheme;
import '../../const/auth_constants.dart';
import '../buttons/default_auth_btn.dart';

class PhoneConfirmationView extends StatefulWidget {
  const PhoneConfirmationView(
      {super.key,
      required this.code,
      required this.onSuccess,
      required this.phoneNumber,
      required this.onCodeResend,
      this.resendCodeEnabled = false,
      this.showTitle = true,
      this.codeTimer = 0,
      required this.onRender,
      this.codeSentVia = 'phone number',
      this.dialogChild,
      this.loading = false,
      this.title,
      this.description});
  final String code;
  final void Function() onSuccess;
  final String phoneNumber;
  final bool showTitle;
  final bool resendCodeEnabled;
  final int codeTimer;
  final void Function() onCodeResend;
  final void Function() onRender;
  final String codeSentVia;
  final Widget? dialogChild;
  final bool loading;
  final String? title;
  final String? description;

  @override
  State<PhoneConfirmationView> createState() => _PhoneConfirmationViewState();
}

class _PhoneConfirmationViewState extends State<PhoneConfirmationView> {
  final TextEditingController _otpController = TextEditingController();
  // final AuthController authController = Get.find();
  final passwordResetController = PasswordResetController();
  bool hasError = false;
  String? currentText;
  final formKey = GlobalKey<FormState>();
  FirebaseAuth auth = FirebaseAuth.instance;
  final String verificationId = Get.arguments[0];

  // verify otp
  // void verifyOtp(
  //     String verificationId,
  //     String userOtp,
  //     ) async {
  //   try {
  //     PhoneAuthCredential creds = PhoneAuthProvider.credential(
  //         verificationId: verificationId, smsCode: userOtp);
  //     User? user = (await auth.signInWithCredential(creds)).user;
  //     if (user != null) {
  //       print(verificationId);
  //       // Get.to(SetNewPassView(passwordResetController: PasswordResetController));
  //     }
  //   } on FirebaseAuthException catch (e) {
  //     Get.snackbar(
  //       e.message.toString(),
  //       "Failed",
  //       colorText: Colors.white,
  //     );
  //   }
  // }


  // void _login() {
  //   if (currentText != null) {
  //     verifyOtp(verificationId, currentText!);
  //   } else {
  //     Get.snackbar(
  //       "Enter 6-Digit code",
  //       "Failed",
  //       colorText: Colors.white,
  //     );
  //   }
  // }

  // snackBar Widget
  snackBar(String? message) {
    return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message!),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      widget.onRender();
    });
  }

  final int codeLength = 6;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showTitle) const StepTitle(title: 'Enter your code here'),
        StepSubTitle(
            subTitle:
                'Enter the 6-digit verification code sent to your ${widget.codeSentVia}  ending with ${widget.phoneNumber.lastChars(3)}'),
        const SizedBox(
          height: 10,
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
            length: codeLength,
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
//errorAnimationController: errorController,
            controller: _otpController,
            keyboardType: TextInputType.number,

            onChanged: (value) => {
              // pass an argument
            },

            onCompleted: (value) {
              setState(() {
                currentText = value;
              });
            },
            // onTap: () {
            //   print("Pressed");
            // },
            // onChanged: (value) {
            //   debugPrint(value);
            //   setState(() {
            //     if (currentText.length > value.length) {
            //       hasError = false;
            //     }
            //     currentText = value;
            //   });
            // },
            beforeTextPaste: (text) {
              debugPrint("Allowing to paste $text");
              //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
              //but you can show anything you want here, like your pop up saying wrong paste format or etc
              return true;
            },
          ),
        ),
        Text('Time remaining: 00:${widget.codeTimer.enableLeadingZero()}'),
        const SizedBox(
          height: 30,
        ),
        AuthButton(
          color: AuthConstants.buttonBlue,
          label: 'Continue',
          actionDissabledColor: AuthConstants.buttonBlueDissabled,
          // onTap: _otpController.text.isEmpty || hasError ? null : () => authController.login(),
        ),
        const SizedBox(
          height: 15,
        ),
        if (widget.resendCodeEnabled)
          AuthButton(
            loading: widget.loading,
            color: Colors.white,
            label: 'Resend Code',
            actionDissabledColor: AuthConstants.buttonBlueDissabled,
            textColor: const Color(0xff34303E),
            boarderColor: AuthConstants.boarderColor,
            onTap: widget.onCodeResend,
          ),
      ],
    );
  }

  void _next() async {
    if (widget.dialogChild != null) {
      await showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => widget.dialogChild!);
      widget.onSuccess();
      return;
    } else {
      widget.onSuccess();
    }
  }
}
