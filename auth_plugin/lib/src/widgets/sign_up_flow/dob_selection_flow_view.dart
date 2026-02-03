import 'package:auth_plugin/src/controllers/auth/sign_up_flow.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultInputField, StepSubTitle, StepTitle, StyleColors;

import '../../const/auth_constants.dart';
import '../buttons/default_auth_btn.dart';

class DOBSelectionView extends StatefulWidget {
  const DOBSelectionView({super.key, required this.signUpFlowController});
  final SignUpFlowController signUpFlowController;

  @override
  State<DOBSelectionView> createState() => _DOBSelectionViewState();
}

class _DOBSelectionViewState extends State<DOBSelectionView> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StepTitle(
            title:
                'Hey ${widget.signUpFlowController.name},what’s your date of birth?'),
        const StepSubTitle(
            subTitle:
                'This is needed to ensure that you are safe on Lukhu and won’t be displayed online.'),
        DefaultInputField(
          hintText: 'Enter your Date of Birth',
          readOnly: true,
          controller: widget.signUpFlowController.dobFieldController,
          onChange: (s) {
            setState(() {});
          },
          onTap: () async {
            // await _getUserDOB(context);
            await _dobPicker(context);
          },
        ),
        const SizedBox(
          height: 50,
        ),
        AuthButton(
          color: AuthConstants.buttonBlue,
          label: 'Continue',
          actionDissabledColor: AuthConstants.buttonBlueDissabled,
          onTap: widget.signUpFlowController.dobFieldController.text.isEmpty
              ? null
              : () {
                  // Go to next option

                  widget.signUpFlowController.currentOption++;
                },
        ),
      ],
    );
  }

  Future<void> _dobPicker(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime(widget.signUpFlowController.dob!.year - 13),
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(DateTime.now().year),
        confirmText: "Apply",
        cancelText: "Cancel",
        initialDatePickerMode: DatePickerMode.day,
        builder: (ctx, child) {
          return Theme(
            data: Theme.of(ctx).copyWith(
                textSelectionTheme: TextSelectionThemeData(
                  selectionColor: StyleColors.lukhuBlue70,
                ),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                  fixedSize: const Size(120, 40),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4)),
                ))),
            child: child!,
          );
        });
    if (picked != null && picked != widget.signUpFlowController.dob!) {
      widget.signUpFlowController.dob = picked;
    }
  }
}
