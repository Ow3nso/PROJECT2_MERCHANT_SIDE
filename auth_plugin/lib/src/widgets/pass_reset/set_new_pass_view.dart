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
import 'package:firebase_auth/firebase_auth.dart';

class SetNewPassView extends StatefulWidget {
  final String fetchEmail;
  
  const SetNewPassView({super.key, required this.passwordResetController, required this.fetchEmail});
  final PasswordResetController passwordResetController;

  @override
  State<SetNewPassView> createState() => _SetNewPassViewState();
}

class _SetNewPassViewState extends State<SetNewPassView> {
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  bool passwordHasError = false;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const StepTitle(title: 'Set New Password'),
          const StepSubTitle(
              subTitle:
                  'Your password must have at least 8 characters, one uppercase, one lowercase, one digit, and a special character (?=.*?[!@#\$&*~])'),
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
                  hintText: 'Keyed Password',
                  obscureText: obscurePassword,
                  controller: widget.passwordResetController.confirmPasswordController,
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
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          ...List.generate(
            _passwordRules.length,
            (i) => PasswordStrengthCard(
              label: _passwordRules[i]['label'],
              has: _passwordRules[i]['has'],
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          AuthButton(
            loading:
                context.watch<UserRepository>().status == Status.authenticating,
            color: AuthConstants.buttonBlue,
            label: 'Set New Password',
            actionDissabledColor: AuthConstants.buttonBlueDissabled,
            onTap: widget.passwordResetController.confirmPasswordController.text.isEmpty
                ? null
                : () async {
                    // Go to next option
                    if (!_formKey.currentState!.validate()) return;
                    if (await _updatePassword()) {
                      NavigationService.navigate(
                          context, PasswordLoginPage.routeName,
                          forever: true);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(context.read<UserRepository>().error ??
                              'Something went wrong, try again !!!')));
                    }
                  },
          ),
        ],
      ),
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

  Future<bool> _updatePassword() async {
    try {
      // Assume user is already logged in or fetched by email
      User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        // Update password
        await user.updatePassword(widget.fetchEmail);

        // Send a confirmation email
        await user.sendEmailVerification();
        
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password updated successfully!')),
        );
        return true;  // Return true when password update succeeds
      } else {
        // Handle the case where the user is null
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('No user found!')),
        );
        return false;
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(e.message ?? 'Failed to update password')),
      );
      return false;  // Return false if an error occurs
    }
  }


}
