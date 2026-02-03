// ignore_for_file: use_build_context_synchronously

import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
import 'package:auth_plugin/src/services/auth/user_data_check.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/user_account_type.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultInputField, DefaultPrefix, StringExtension, UserFields;

import '../../const/auth_constants.dart';
import '../../pages/login.dart';
import '../../services/field_validators.dart';
import '../buttons/default_auth_btn.dart';

class AddPhoneNumberView extends StatefulWidget {
  const AddPhoneNumberView({super.key, required this.signUpFlowController});
  final SignUpFlowController signUpFlowController;

  @override
  State<AddPhoneNumberView> createState() => _AddPhoneNumberViewState();
}

class _AddPhoneNumberViewState extends State<AddPhoneNumberView> {
  bool phoneHasError = false;

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
            hintText: '712 345 678',
            prefix: const DefaultPrefix(text: "+254"),
            controller: widget.signUpFlowController.phoneController,
            suffix: phoneHasError ? const SuffixErrorIcon() : null,
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
          color: AuthConstants.buttonBlue,
          label: 'Continue',
          actionDissabledColor: AuthConstants.buttonBlueDissabled,
          onTap: widget.signUpFlowController.phoneController.text.isEmpty
              ? null
              : () async {
                  // Go to next option
                  if (!_formKey.currentState!.validate()) return;
                  if (await UserDataCheck.isValueTaken(
                      widget.signUpFlowController.phoneController.text
                          .toLukhuNumber(),
                      UserFields.phoneNumber)) {
                    setState(() {
                      phoneHasError = true;
                    });
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('The Provided phone number is taken')));
                    return;
                  }

                  widget.signUpFlowController.currentOption++;
                },
        ),
      ],
    );
  }
}
