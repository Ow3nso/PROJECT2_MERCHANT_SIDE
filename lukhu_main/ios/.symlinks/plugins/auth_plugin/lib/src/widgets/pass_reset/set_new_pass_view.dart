// ignore_for_file: use_build_context_synchronously

import 'package:auth_plugin/src/controllers/auth/password_reset.dart';
import 'package:auth_plugin/src/widgets/sign_up_flow/user_account_type.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show NavigationService, ReadContext, WatchContext;
import '../../const/auth_constants.dart';
import '../../controllers/user/user_repository.dart';
import '../../pages/login.dart';
import '../../services/field_validators.dart';
import '../buttons/default_auth_btn.dart';
import '../inputs/auth_input_field.dart';
import '../sign_up_flow/set_password_flow_view.dart';

class SetNewPassView extends StatefulWidget {
  const SetNewPassView({super.key, required this.passwordResetController});
  final PasswordResetController passwordResetController;

  @override
  State<SetNewPassView> createState() => _SetNewPassViewState();
}

class _SetNewPassViewState extends State<SetNewPassView> {
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  bool passwordHasError = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Set New Password',
          style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: AuthConstants.lukhuPink),
        ),
        const StepSubTitle(
            subTitle:
                'Your password must have at least 8 characters,one upper case,one lower case,one digit and a special character (?=.*?[!@#\$&*~])'),
        Form(
            key: _formKey,
            child: Column(
              children: [
                AuthInputField(
                  label: 'Password',
                  hintText: 'Strong Password',
                  obscureText: obscurePassword,
                  controller: widget.passwordResetController.passwordController,
                  validator: (s) {
                    final error = FieldsValidator.passwordVlidator(s);
                    setState(() {
                      passwordHasError = error != null;
                    });
                    return error;
                  },
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    child: obscurePassword
                        ? passwordHasError
                            ? const SuffixErrorIcon()
                            : Icon(
                                Icons.visibility_off_rounded,
                                color: AuthConstants.suffixGray,
                              )
                        : Icon(Icons.visibility_rounded,
                            color: AuthConstants.suffixGray),
                  ),
                  onChange: (s) {
                    setState(() {});
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                AuthInputField(
                  label: 'Confirm Password',
                  hintText: 'keyed Password',
                  obscureText: obscurePassword,
                  controller:
                      widget.passwordResetController.confirmPasswordController,
                  validator: (s) {
                    String? error;
                    if (widget.passwordResetController.passwordController.text
                            .trim() !=
                        widget.passwordResetController.confirmPasswordController
                            .text
                            .trim()) {
                      error = 'Passwords don\'t match';
                    }
                    setState(() {
                      passwordHasError = error != null;
                    });
                    return error;
                  },
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setState(() {
                        obscurePassword = !obscurePassword;
                      });
                    },
                    child: obscurePassword
                        ? passwordHasError
                            ? const SuffixErrorIcon()
                            : Icon(
                                Icons.visibility_off_rounded,
                                color: AuthConstants.suffixGray,
                              )
                        : Icon(Icons.visibility_rounded,
                            color: AuthConstants.suffixGray),
                  ),
                  onChange: (s) {
                    setState(() {});
                  },
                )
              ],
            )),
        const SizedBox(
          height: 15,
        ),
        ...List.generate(
            _passwordRules.length,
            (i) => PasswordStrengthCard(
                  label: _passwordRules[i]['label'],
                  has: _passwordRules[i]['has'],
                )),
        const SizedBox(
          height: 15,
        ),
        AuthButton(
          loading:
              context.watch<UserRepository>().status == Status.authenticating,
          color: AuthConstants.buttonBlue,
          label: 'Set New Password',
          actionDissabledColor: AuthConstants.buttonBlueDissabled,
          onTap: widget.passwordResetController.confirmPasswordController.text
                  .isEmpty
              ? null
              : () async {
                  // Go to next option
                  if (!_formKey.currentState!.validate()) return;
                  if (await _resetPassword()) {
                    NavigationService.navigate(
                        context,  PasswordLoginPage.routeName,
                        forever: true);
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text(context.read<UserRepository>().error ??
                            'Something went wrong, try again !!!')));
                  }
                },
        ),
      ],
    );
  }

  List<Map<String, dynamic>> get _passwordRules =>
      FieldsValidator.passwordRules(
          widget.passwordResetController.passwordController.text);
  Future<bool> _resetPassword() async {
    return await context.read<UserRepository>().resetPassword(
        widget.passwordResetController.otpCode ?? '',
        widget.passwordResetController.confirmPasswordController.text.trim());
  }
}
