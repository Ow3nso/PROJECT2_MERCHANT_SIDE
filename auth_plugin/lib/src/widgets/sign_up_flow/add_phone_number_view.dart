// ignore_for_file: use_build_context_synchronously

import 'package:get/get.dart';
import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/otp_controller.dart';
import 'package:auth_plugin/src/services/auth/user_data_check.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/user_account_type.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultInputField, ReadContext, UserFields, WatchContext;
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultInputField, DefaultPrefix, ReadContext, StringExtension, UserFields;

import 'package:firebase_auth/firebase_auth.dart';

import '../../const/auth_constants.dart';
import '../../controllers/user/user_repository.dart';
import '../../pages/otp_page.dart';
import '../../services/field_validators.dart';
import '../buttons/default_auth_btn.dart';

class AddPhoneNumberView extends StatefulWidget {
  const AddPhoneNumberView({super.key, required this.signUpFlowController});
  final SignUpFlowController signUpFlowController;

  @override
  State<AddPhoneNumberView> createState() => _AddPhoneNumberViewState();
}

class _AddPhoneNumberViewState extends State<AddPhoneNumberView> {
  // final AuthController authController = Get.find();
  bool phoneHasError = false;
  FirebaseAuth auth = FirebaseAuth.instance;
  String? verificationId;
  String? currentText;
  
  SignUpFlowController get signUpFlowController => widget.signUpFlowController;

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
        Get.to(OtpPage(), arguments: [verificationId]);
        await auth.signInWithCredential(credential);
        // authentication successful, do something
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const StepTitle(title: 'What’s your phone number?'),
        const StepSubTitle(
            subTitle:
                'Your phone number will be used to make and receive payments via M-PESA'),
        Form(
          key: _formKey,
          child: DefaultInputField(
            onChange: (s) {
              setState(() {});
            },
            keyboardType: TextInputType.phone,
            hintText: '0712 345 678',
            prefix: const DefaultPrefix(text: "+254"),
            controller: widget.signUpFlowController.phoneController,
            // suffix: phoneHasError ? const SuffixErrorIcon() : null,
            validator: (s) {
              final error = FieldsValidator.phoneValidator(s);
              setState(() {
                phoneHasError = error != null;
              });
              return error;
            },
          ),
        ),
        const SizedBox(
          height: 50,
        ),
        AuthButton(
          loading: context.watch<UserRepository>().status == Status.loading,
          color: AuthConstants.buttonBlue,
          label: 'Continue',
          actionDissabledColor: AuthConstants.buttonBlueDissabled,
          onTap: widget.signUpFlowController.phoneController.text.isEmpty
              ? null
              : () async {
                  if (!_formKey.currentState!.validate()) return;

                  if (await UserDataCheck.isValueTaken(
                      widget.signUpFlowController.phoneController.text
                          .toLukhuNumber(),
                      UserFields.phoneNumber)) {
                    setState(() {
                      phoneHasError = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('The provided phone number is already taken')));
                    return;
                  }

                  // Trigger phone number verification
                  signInWithPhoneNumber(
                    '+${widget.signUpFlowController.phoneController.text.toLukhuNumber()}',
                  );
                  // widget.signUpFlowController.currentOption++;
                },
        ),
      ],
    );
  }
}
