import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AuthInputField, StepSubTitle, StepTitle;

import '../../const/auth_constants.dart';
import '../buttons/default_auth_btn.dart';

class UserPhoneFlow extends StatefulWidget {
  const UserPhoneFlow({super.key, required this.signUpFlowController});
  final SignUpFlowController signUpFlowController;

  @override
  State<UserPhoneFlow> createState() => _UserPhoneFlowState();
}

class _UserPhoneFlowState extends State<UserPhoneFlow> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const StepTitle(title: 'What’s your name?'),
        const StepSubTitle(
            subTitle: 'This will help us personalize Lukhu for you'),
        AuthInputField(
          onChange: (s) {
            setState(() {});
          },
          controller: widget.signUpFlowController.phoneController,
          keyboardType: TextInputType.name,
          label: 'Name',
          hintText: 'John Doe',
        ),
        const SizedBox(
          height: 55,
        ),
        AuthButton(
          //loading: context.watch<UserRepository>().status == Status.loading,
          color: AuthConstants.buttonBlue,
          label: 'Continue',
          actionDissabledColor: AuthConstants.buttonBlueDissabled,
          onTap: widget.signUpFlowController.phoneController.text.isEmpty
              ? null
              : () {
                  widget.signUpFlowController.currentOption++;
                },
        ),
      ],
    );
  }
}
