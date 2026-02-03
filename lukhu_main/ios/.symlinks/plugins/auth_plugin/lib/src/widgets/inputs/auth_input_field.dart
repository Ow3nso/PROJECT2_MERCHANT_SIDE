import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:flutter/material.dart';

class AuthInputField extends StatelessWidget {
  const AuthInputField(
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
      this.readOnly = false});
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (label != null)
          Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Text(
                  label!,
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: AuthConstants.gray90),
                ),
              )),
        TextFormField(
          readOnly: readOnly,
          controller: controller,
          obscureText: obscureText,
          keyboardType: keyboardType,
          onChanged: onChange,
          validator: validator,
          textInputAction: textInputAction,
          obscuringCharacter: '*',
          onFieldSubmitted: onFieldSubmitted,
          onTap: onTap,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              errorStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: AuthConstants.textErrorRed),
              suffixIcon: suffixIcon,
              hintText: hintText,
              helperText: helperText,
              suffix: suffix,
              suffixIconColor: AuthConstants.suffixGray,
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: AuthConstants.textFieldBoarderGray)),
              disabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: AuthConstants.textFieldBoarderGray)),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: AuthConstants.textFieldBoarderGray)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: AuthConstants.buttonBlueDissabled)),
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide:
                      BorderSide(color: AuthConstants.boarderErrorRed))),
        ),
      ],
    );
  }
}
