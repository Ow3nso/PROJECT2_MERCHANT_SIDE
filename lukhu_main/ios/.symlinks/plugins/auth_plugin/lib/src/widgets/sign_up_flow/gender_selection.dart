import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultDropdown, StepSubTitle, StepTitle;

import '../../const/auth_constants.dart';
import '../buttons/default_auth_btn.dart';

class GenderSelection extends StatefulWidget {
  const GenderSelection({super.key, required this.signUpFlowController});
  final SignUpFlowController signUpFlowController;

  @override
  State<GenderSelection> createState() => _GenderSelectionState();
}

class _GenderSelectionState extends State<GenderSelection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const StepTitle(title: 'What do you identify yourself as?'),
        const StepSubTitle(
            subTitle:
                'This information will help us curate the best experience for you on Lukhu.'),
        DefaultDropdown(
          items: const ["Male", "Female", "Other"],
          hintWidget: Text(widget.signUpFlowController.gender ?? "Select one"),
          itemChild: (value) => Text(value),
          onChanged: (value) {
            setState(() {
              widget.signUpFlowController.gender = value;
            });
          },
          isExpanded: true,
        ),
        const SizedBox(
          height: 55,
        ),
        AuthButton(
          //loading: context.watch<UserRepository>().status == Status.loading,
          color: AuthConstants.buttonBlue,
          label: 'Continue',
          actionDissabledColor: AuthConstants.buttonBlueDissabled,
          onTap: widget.signUpFlowController.gender == null
              ? null
              : () {
                  widget.signUpFlowController.currentOption++;
                },
        ),
      ],
    );
  }
}
