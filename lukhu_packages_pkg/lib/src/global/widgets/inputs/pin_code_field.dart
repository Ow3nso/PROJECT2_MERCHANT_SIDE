import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AnimationType, PinCodeFieldShape, PinCodeTextField, PinTheme;

import '../../../utils/styles/colors.dart';

class PinCodeField extends StatelessWidget {
  const PinCodeField(
      {super.key,
      required this.onChanged,
      this.hasError = false,
      this.codeLength = 4,
      this.otpController,
      this.onCompleted,
      this.beforeTextPaste,
      this.enableActiveFill = true,
      this.obscureText = false,
      this.showCursor = false,
      this.fieldHeight = 32,
      this.fieldWidth = 32
      });

  /// Used to change the color of the pin code field.
  final bool hasError;

  /// The length of the pin code.
  final int codeLength;

  /// Used to control the text field.
  final TextEditingController? otpController;

  /// A function that is called when the text is completed.
  final void Function(String)? onCompleted;

  /// A function that is called when the text changes.
  final void Function(String) onChanged;

  /// A function that is called before the text is pasted.
  final bool Function(String?)? beforeTextPaste;

  /// Used to enable the active fill color.
  final bool enableActiveFill;

  /// Used to hide the text in the text field.
  final bool obscureText;

  /// Showing the cursor in the text field.
  final bool showCursor;

/// Used to set the height of the pin code field.
  final double fieldHeight;

/// Used to set the width of the pin code field.
  final double fieldWidth;

  @override
  Widget build(BuildContext context) {
    return PinCodeTextField(
      textStyle: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.w500,
          color: hasError ? StyleColors.textErrorRed : StyleColors.goodGreen),
      appContext: context,
      pastedTextStyle: TextStyle(
        color: StyleColors.goodGreen,
        fontWeight: FontWeight.bold,
      ),
      length: codeLength,
      obscureText: obscureText,
      showCursor: showCursor,
      blinkWhenObscuring: true,
      animationType: AnimationType.fade,
      validator: (v) {
        return null;
      },
      pinTheme: PinTheme(
          borderWidth: 1,
          shape: PinCodeFieldShape.box,
          borderRadius: BorderRadius.circular(8),
          fieldHeight: fieldHeight,
          fieldWidth: fieldWidth,
          activeFillColor: Colors.white,
          inactiveColor: StyleColors.boarderColor,
          inactiveFillColor: Colors.white,
          selectedFillColor: Colors.white,
          activeColor:
              hasError ? StyleColors.textErrorRed : StyleColors.goodGreen,
          selectedColor: StyleColors.boarderColor,
          errorBorderColor: StyleColors.boarderErrorRed),
      cursorColor: Colors.black,
      animationDuration: const Duration(milliseconds: 300),
      enableActiveFill: enableActiveFill,
      controller: otpController,
      keyboardType: TextInputType.number,
      onCompleted: onCompleted,
      onChanged: onChanged,
      beforeTextPaste: beforeTextPaste,
    );
  }
}
