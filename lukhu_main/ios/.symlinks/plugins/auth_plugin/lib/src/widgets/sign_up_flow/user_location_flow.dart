import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart';

import '../buttons/default_auth_btn.dart';

class UserLocationFlow extends StatefulWidget {
  const UserLocationFlow({super.key, required this.signUpController});
  final SignUpFlowController signUpController;

  @override
  State<UserLocationFlow> createState() => _UserLocationFlowState();
}

class _UserLocationFlowState extends State<UserLocationFlow> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const StepTitle(title: 'Where are you located?'),
        const StepSubTitle(
            subTitle: 'This will also help us serve you a lot better.'),
        Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: DefaultInputField(
            textInputAction: TextInputAction.next,
            controller: widget.signUpController.locationController,
            prefix: Image.asset(
              AuthConstants.locationIcon,
              package: AuthConstants.pluginName,
            ),
            keyboardType: TextInputType.streetAddress,
            onChange: (_) {
              setState(() {});
            },
            hintText: "Select your location",
          ),
        ),
        DefaultInputField(
          textInputAction: TextInputAction.done,
          keyboardType: TextInputType.streetAddress,
          controller: widget.signUpController.buildingHouseController,
          onChange: (_) {
            setState(() {});
          },
          hintText: "Building/House Number",
        ),
        const SizedBox(
          height: 55,
        ),
        AuthButton(
          //loading: context.watch<UserRepository>().status == Status.loading,
          color: AuthConstants.buttonBlue,
          label: 'Continue',
          actionDissabledColor: AuthConstants.buttonBlueDissabled,
          onTap: widget.signUpController.locationController.text.isEmpty
              ? null
              : () {
                  widget.signUpController.currentOption++;
                },
        ),
      ],
    );
  }
}
