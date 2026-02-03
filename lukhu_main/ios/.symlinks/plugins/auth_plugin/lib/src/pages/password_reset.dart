import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:auth_plugin/src/controllers/auth/password_reset.dart';
import 'package:auth_plugin/src/pages/sign_up.dart';
import 'package:auth_plugin/src/widgets/pass_reset/phone_email_input_view.dart';
import 'package:auth_plugin/src/widgets/pass_reset/set_new_pass_view.dart';

import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart';

class PasswordReset extends StatefulWidget {
  const PasswordReset({super.key});
  static const routeName = 'password_reset';

  @override
  State<PasswordReset> createState() => _PasswordResetState();
}

class _PasswordResetState extends State<PasswordReset> {
  final passwordResetController = PasswordResetController();

  List<Widget> get _options => [
        PhoneEmailView(passwordResetController: passwordResetController),
        SetNewPassView(passwordResetController: passwordResetController)
      ];

  @override
  Widget build(BuildContext context) {
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
                      const SizedBox(
                        height: 15,
                      ),
                      if (passwordResetController.currentOption < 2)
                        Text(
                          'Reset Your Password',
                          style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w800,
                              fontFamily: GoogleFonts.inter().fontFamily,
                              color: AuthConstants.textDarkColor),
                        ),
                      Expanded(
                          child:
                              _options[passwordResetController.currentOption])
                    ],
                  ),
                );
              })),
    );
  }
}
