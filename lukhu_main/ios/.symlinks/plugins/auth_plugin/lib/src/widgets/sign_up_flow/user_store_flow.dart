import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultInputField, StepSubTitle, StepTitle;

import '../../const/auth_constants.dart';
import '../buttons/default_auth_btn.dart';

class UserStoreFlow extends StatefulWidget {
  const UserStoreFlow({super.key, required this.signUpController});
  final SignUpFlowController signUpController;

  @override
  State<UserStoreFlow> createState() => _UserStoreFlowState();
}

class _UserStoreFlowState extends State<UserStoreFlow> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const StepTitle(title: 'What\'s your store name?'),
        const StepSubTitle(
            subTitle: 'This will also help us personalize Lukhu for you'),
        DefaultInputField(
          controller: widget.signUpController.storeNameController,
          textInputAction: TextInputAction.done,
          onChange: (s) {
            setState(() {});
          },
          label: 'Store Name',
        ),
        const SizedBox(
          height: 55,
        ),
        AuthButton(
          color: AuthConstants.buttonBlue,
          label: 'Continue',
          actionDissabledColor: AuthConstants.buttonBlueDissabled,
          onTap: widget.signUpController.storeNameController.text.isEmpty
              ? null
              : () {
                  widget.signUpController.currentOption++;
                },
        ),
      ],
    );
  }
}
