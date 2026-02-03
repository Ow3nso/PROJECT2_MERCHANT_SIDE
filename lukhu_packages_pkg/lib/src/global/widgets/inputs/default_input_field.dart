import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/styles/colors.dart';

/// This class is a stateless widget that takes in a bunch of parameters and returns a text field with
/// the given parameters
class DefaultInputField extends StatelessWidget {
  const DefaultInputField(
      {super.key,
      this.onChange,
      this.suffixIcon,
      this.hintText,
      this.obscureText = false,
      this.controller,
      this.keyboardType,
      this.validator,
      this.textInputAction,
      this.onFieldSubmitted,
      this.label,
      this.helperText,
      this.suffix,
      this.onTap,
      this.readOnly = false,
      this.padding,
      this.maxLines,
      this.labelStyle,
      this.radius = 10,
      this.prefix,
      this.border,
      this.textInputFormatter = const []});
  final void Function(String?)? onChange;
  final Widget? suffixIcon;
  final String? hintText;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final void Function(String?)? onFieldSubmitted;
  final String? label;
  final String? helperText;
  final Widget? suffix;
  final void Function()? onTap;
  final bool readOnly;
  final int? maxLines;
  final EdgeInsets? padding;
  final TextStyle? labelStyle;
  final double radius;
  final Widget? prefix;
  final InputBorder? border;
  final List<TextInputFormatter> textInputFormatter;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null)
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: Text(
                  label!,
                  style: labelStyle ??
                      TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: StyleColors.gray90),
                ),
              )),
        TextFormField(
          inputFormatters: textInputFormatter,
          readOnly: readOnly,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChange,
          validator: validator,
          maxLines: maxLines,
          textInputAction: textInputAction,
          obscuringCharacter: '*',
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              prefixIcon: prefix,
              contentPadding: padding ??
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              errorStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: StyleColors.textErrorRed),
              suffixIcon: suffixIcon,
              hintText: hintText,
              helperText: helperText,
              suffix: suffix,
              suffixIconColor: StyleColors.suffixGray,
              enabledBorder: border ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius),
                      borderSide:
                          BorderSide(color: StyleColors.textFieldBoarderGray)),
              disabledBorder: border ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius),
                      borderSide:
                          BorderSide(color: StyleColors.textFieldBoarderGray)),
              border: border ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius),
                      borderSide:
                          BorderSide(color: StyleColors.textFieldBoarderGray)),
              focusedBorder: border ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius),
                      borderSide:
                          BorderSide(color: StyleColors.buttonBlueDissabled)),
              errorBorder: border ??
                  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(radius),
                      borderSide:
                          BorderSide(color: StyleColors.boarderErrorRed))),
        ),
      ],
    );
  }
}
