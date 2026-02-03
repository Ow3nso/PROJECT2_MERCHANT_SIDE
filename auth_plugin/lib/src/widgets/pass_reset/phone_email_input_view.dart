// ignore_for_file: use_build_context_synchronously
import 'package:get/get.dart';
import 'package:auth_plugin/src/controllers/auth/password_reset.dart';
import 'package:auth_plugin/src/pages/login.dart';
import 'package:auth_plugin/src/widgets/pass_reset/otp_screen.dart';
import 'package:flutter/material.dart';
import 'package:auth_plugin/src/widgets/pass_reset/set_new_pass_view.dart';
import 'package:auth_plugin/src/widgets/pass_reset/otp_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show ReadContext, StringExtension, UserFields;
import '../../const/auth_constants.dart';
import '../../controllers/user/user_repository.dart';
import '../../services/auth/user_data_check.dart';
import '../../services/field_validators.dart';
import '../buttons/default_auth_btn.dart';
import '../inputs/auth_input_field.dart';
import '../sign_up_flow/user_account_type.dart';

class PhoneEmailView extends StatefulWidget {
  const PhoneEmailView({super.key, required this.passwordResetController});
  final PasswordResetController passwordResetController;

  @override
  State<PhoneEmailView> createState() => _PhoneEmailViewState();
}

class _PhoneEmailViewState extends State<PhoneEmailView> {
  final passwordResetController = PasswordResetController();
  final _formKey = GlobalKey<FormState>();
  bool _loading = false;
  String? _email;
  String? get email => _email;
  set email(String? value) {
    _email = value;
    setState(() {});
  }

  bool get loading => _loading;
  set loading(bool value) {
    _loading = value;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const StepSubTitle(
            subTitle:
                'Enter your email or phone number to receive a code to reset your password.'),
        Form(
          key: _formKey,
          child: AuthInputField(
            suffix: widget.passwordResetController.emailPhoneHasError ||
                    widget.passwordResetController.error.isNotEmpty
                ? const SuffixErrorIcon()
                : null,
            onChange: (s) {
              setState(() {});
            },
            validator: (s) {
              final error = FieldsValidator.emailOrPhoneValidator(s);

              widget.passwordResetController.emailPhoneHasError = error != null;
              return error;
            },
            controller: widget.passwordResetController.emailPhoneController,
            hintText: 'email or phone number',
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        AuthButton(
          loading: loading,
          color: AuthConstants.buttonBlue,
          label: 'Continue',
          actionDissabledColor: AuthConstants.buttonBlueDissabled,
          // onTap: _userLogin,
          onTap: widget
                  .passwordResetController.emailPhoneController.text.isEmpty
              ? null
              : () async {
                  // Go to next option
                  if (!_formKey.currentState!.validate()) return;
                  if (await _hasAccount()) {
                    _userLogin();
                    // Navigator.push(
                    //   context, 
                    //   MaterialPageRoute(builder: (context) => ResetPasswordPage())
                    // );
                    // await showDialog(
                    //     barrierDismissible: false,
                    //     context: context,
                    //     builder:(context) => SetNewPassView(passwordResetController: passwordResetController));
                        // builder: (_) => PassResetConfirmationDialog(email: email!,));
                  } else {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        duration: const Duration(seconds: 1),
                        content: Text(widget.passwordResetController.error)));
                  }
                },
        ),
      ],
    );
  }

  Future<bool> _hasAccount() async {
    loading = true;
    widget.passwordResetController.error = '';
    String? numberRelatedEmail =
        widget.passwordResetController.emailPhoneController.text;
    if (numberRelatedEmail.isNumeric()) {
      //Send sms
      String? d = await UserDataCheck.getEmailByPhone(
          numberRelatedEmail.trim().toLukhuNumber());
      if (d == null) {
        loading = false;
        widget.passwordResetController.error =
            'There is no account associated with this phone: [${numberRelatedEmail.trim().toLukhuNumber()}]';
        return false;
      }
      numberRelatedEmail = d;
    }
    bool taken =
        await UserDataCheck.isValueTaken(numberRelatedEmail, UserFields.email);
    if (!taken) {
      loading = false;
      widget.passwordResetController.error =
          'There is no account associated with this email: [${numberRelatedEmail.trim()}],create an account if you\'re a new user.';
      return false;
    }

    loading = false;
    email = numberRelatedEmail;
    return await context
        .read<UserRepository>()
        .recoverPassword(numberRelatedEmail.trim());
  }

  Future<void> signInWithPhoneNumber(String phoneNumber) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential);
        // authentication successful, do something
      },
      verificationFailed: (FirebaseAuthException e) {
        // authentication failed, do something
      },
      codeSent: (String verificationId, int? resendToken) async {
        // code sent to phone number, save verificationId for later use
        String smsCode = ''; // get sms code from user
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId,
          smsCode: smsCode,
        );

        String? fetchEmail = widget.passwordResetController.emailPhoneController.text;
        Get.to(ResetPasswordPage(fetchEmail: fetchEmail), arguments: [verificationId]);
        
        await auth.signInWithCredential(credential);
        // authentication successful, do something
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void _userLogin() async {
  String? numberRelatedEmail =
      widget.passwordResetController.emailPhoneController.text;

  if (numberRelatedEmail.isNumeric()) {
    signInWithPhoneNumber(formatPhoneNumber(numberRelatedEmail));
  } else {
    String? phoneNumber = await UserDataCheck.getPhoneByEmail(numberRelatedEmail);

    if (phoneNumber != null) {
      signInWithPhoneNumber(formatPhoneNumber(phoneNumber));
    } else {
      print('No phone number found for the provided email');
    }
  }
}

String formatPhoneNumber(String phoneNumber) {
  phoneNumber = phoneNumber.replaceAll(RegExp(r'\s+'), '');

  if (RegExp(r'^\+254\d{9}$').hasMatch(phoneNumber)) {
    return phoneNumber; 
  }

  if (RegExp(r'^254\d{9}$').hasMatch(phoneNumber)) {
    return phoneNumber.replaceFirst(RegExp(r'^254'), '+254');
  }

  if (RegExp(r'^07\d{8}$').hasMatch(phoneNumber)) {
    return phoneNumber.replaceFirst(RegExp(r'^07'), '+2547');
  }

  if (RegExp(r'^01\d{8}$').hasMatch(phoneNumber)) {
    return phoneNumber.replaceFirst(RegExp(r'^01'), '+2541');
  }

  throw FormatException('Invalid phone number format');
}



  // void _userLogin() async {
  //   String mobile = phoneController.text;
  //   if (mobile == "") {
  //     Get.snackbar(
  //       "Please enter the mobile number!",
  //       "Failed",
  //       colorText: Colors.white,
  //     );
  //   } else {
  //     signInWithPhoneNumber("+254707394018");
  //   }
  // }
}
