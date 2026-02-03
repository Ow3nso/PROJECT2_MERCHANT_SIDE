import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:auth_plugin/src/utils/helpers.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show GoogleFonts, ShortMessages, StyleColors;

class DukastaxLinkButton extends StatelessWidget {
  const DukastaxLinkButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        text: 'By using the Lukhu app, you agree to our',
        children: [
          TextSpan(
            text: "\nTerms of service",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Helpers.launchInBrowser(
                        Uri.parse(AuthConstants.termsOfServiceDuka))
                    .catchError((e, s) {
                  ShortMessages.showShortMessage(
                      message: "Something happended");
                });
              },
            style: TextStyle(
              color: StyleColors.lukhuBlue,
            ),
          ),
          const TextSpan(text: " and "),
          TextSpan(
            text: "Privacy Policy",
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Helpers.launchInBrowser(
                  Uri.parse(AuthConstants.privacyPolicyDuka),
                ).catchError((e, s) {
                  ShortMessages.showShortMessage(
                      message: "Something happended");
                });
              },
            style: TextStyle(
              color: StyleColors.lukhuBlue,
            ),
          ),
        ],
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: GoogleFonts.inter().fontFamily,
          color: StyleColors.dark,
        ),
      ),
    );
  }
}
