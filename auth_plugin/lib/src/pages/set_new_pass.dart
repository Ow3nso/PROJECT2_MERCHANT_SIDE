import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:get/get.dart';
import 'package:auth_plugin/src/controllers/auth/password_reset.dart';
import 'package:auth_plugin/src/pages/sign_up.dart';
import 'package:auth_plugin/src/widgets/buttons/default_auth_btn.dart';
import 'package:auth_plugin/src/widgets/pass_reset/phone_email_input_view.dart';
import 'package:auth_plugin/src/widgets/pass_reset/set_new_pass_view.dart';

import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart';

class FieldsValidator {
  static String? passwordValidator(String? password) {
    // Check if the password is null or empty
    if (password == null || password.isEmpty) {
      return 'Password cannot be empty';
    }

    // Check if the password length is at least 8 characters
    if (password.length < 8) {
      return 'Password must be at least 8 characters long';
    }

    // Check for at least one uppercase letter
    if (!RegExp(r'(?=.*[A-Z])').hasMatch(password)) {
      return 'Password must contain at least one uppercase letter';
    }

    // Check for at least one lowercase letter
    if (!RegExp(r'(?=.*[a-z])').hasMatch(password)) {
      return 'Password must contain at least one lowercase letter';
    }

    // Check for at least one special character
    if (!RegExp(r'(?=.*?[!@#\$&*~])').hasMatch(password)) {
      return 'Password must contain at least one special character';
    }

    return null; // No error, validation passed
  }

  static String? confirmPasswordValidator(String? password, String? confirmPassword) {
    if (password != confirmPassword) {
      return 'Passwords do not match';
    }
    return null; // No error, validation passed
  }
}


class SetNewPassPage extends StatefulWidget {
  final String fetchEmail; 

  const SetNewPassPage({super.key, required this.fetchEmail});
  
  static const routeName = 'set_new_pass';

  @override
  State<SetNewPassPage> createState() => _SetNewPassPage();
}

class _SetNewPassPage extends State<SetNewPassPage> {
  final passwordResetController = PasswordResetController();
  final _formKey = GlobalKey<FormState>();
  bool obscurePassword = true;
  bool passwordHasError = false;
  bool _isLoading = false;

  String? _email;
  String? _password;
  String? _confirmPassword;

  @override
  void initState() {
    super.initState();
    _email = Get.arguments as String?;
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> _updatePassword() async {
      try {
        // Assume user is already logged in or fetched by email
        User? user = FirebaseAuth.instance.currentUser;

        if (user != null) {

          // AuthCredential credential = EmailAuthProvider.credential(
          //   email: widget.fetchEmail,
          //   password: 'Nyamburi@123',
          // );

          // // Reauthenticate the user
          // await user.reauthenticateWithCredential(credential);
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
    return Scaffold(
      backgroundColor: AuthConstants.optionCardBackgroundBlue,
      body: SafeArea(
        child: AnimatedBuilder(
          animation: passwordResetController,
          builder: (_, c) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AuthBackButton(
                    onPressed: () {
                      if (passwordResetController.currentOption == 0) {
                        Navigator.pop(context);
                        return;
                      }
                      passwordResetController.currentOption--;
                    },
                  ),
                  const SizedBox(height: 15),
                  const StepTitle(title: 'Set New Password'),
                  const StepSubTitle(
                      subTitle:
                          'Your password must have at least 8 characters, one uppercase, one lowercase, one digit, and a special character (?=.*?[!@#\$&*~])'),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        // Password field
                        AuthInputField(
                          label: 'Password',
                          hintText: 'Strong Password',
                          obscureText: obscurePassword,
                          onChange: (s) {
                            setState(() {
                              _password = s;
                            });
                          },
                          validator: (s) {
                            final error = FieldsValidator.passwordValidator(s);
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
                        ),
                        const SizedBox(height: 10),
                        // Confirm Password field
                        AuthInputField(
                          label: 'Confirm Password',
                          hintText: 'Keyed Password',
                          obscureText: obscurePassword,
                          onChange: (s) {
                            setState(() {
                              _confirmPassword = s;
                            });
                          },
                          validator: (s) {
                            final error = FieldsValidator.confirmPasswordValidator(
                                _password, s);
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
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  // Submit Button
                  AuthButton(
                    loading: _isLoading,
                    color: AuthConstants.buttonBlue,
                    label: 'Set New Password',
                    actionDissabledColor: AuthConstants.buttonBlueDissabled,
                    onTap: () {
                      if (_formKey.currentState?.validate() ?? false) {
                        // Process password reset if the form is valid
                        _updatePassword();
                      }
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
