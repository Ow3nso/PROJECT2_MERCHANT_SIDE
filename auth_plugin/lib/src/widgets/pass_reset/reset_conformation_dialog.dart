import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show NavigationService;

import '../../const/auth_constants.dart';
import '../../pages/login.dart';
import '../buttons/default_auth_btn.dart';

class PassResetConfirmationDialog extends StatelessWidget {
  const PassResetConfirmationDialog({super.key, required this.email});
  final String email;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80),
                  child: Container(
                    width: 375,
                    height: 205,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Password Reset Confirmation',
                              style: TextStyle(
                                  color: AuthConstants.textDarkColor,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            "Hello, a password reset link has been sent to your email address $email.",
                            textAlign: TextAlign.center,
                            style: _grayStyle(),
                          ),
                          const Divider(),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              'Follow the provided steps to reset your password (Check span folder if you don\'t receive the email)',
                              textAlign: TextAlign.center,
                              style: _grayStyle().copyWith(
                                  fontWeight: FontWeight.w300,
                                  fontStyle: FontStyle.italic),
                            ),
                          ),
                          AuthButton(
                            width: 296,
                            color: AuthConstants.buttonBlue,
                            label: 'Sign In'.toUpperCase(),
                            actionDissabledColor:
                                AuthConstants.buttonBlueDissabled,
                            onTap: () {
                              NavigationService.navigate(
                                  context, PasswordLoginPage.routeName,
                                  forever: true);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  TextStyle _grayStyle() {
    return TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        color: AuthConstants.tinyGray);
  }
}
