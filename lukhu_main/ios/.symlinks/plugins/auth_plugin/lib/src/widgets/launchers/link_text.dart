import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:auth_plugin/src/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show NavigationService;

class LinkTextButton extends StatelessWidget {
  ///
  ///Display a text with a link to launch externally
  const LinkTextButton(
      {Key? key,
      required this.text,
      required this.url,
      required this.urlHolderText,
      this.inApp = false,
      this.data})
      : super(key: key);

  final String text;

  /// The into text

  final String url;

  /// The URL to be launch

  final String urlHolderText;

  /// A value to hold the URl action
  ///
  final bool inApp;

  ///
  ///specify to navigate within the app routes
  ///
  ///Note the url has to be a valid app route
  final Map<String, dynamic>? data;

  /// arguments to pass for local navigation

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        Padding(
          padding: const EdgeInsets.only(left: 2),
          child: TextButton(
              onPressed: () => _launchURL(context),
              style: TextButton.styleFrom(
                  padding: EdgeInsets.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  alignment: Alignment.centerLeft),
              child: Text(
                urlHolderText,
                style: TextStyle(
                    color: AuthConstants.linkBlue, fontWeight: FontWeight.bold),
              )),
        )
      ],
    );
  }

  _launchURL(BuildContext context) async {
    if (!inApp) {
      Uri uri = Uri.parse(url);
      Helpers.launchInBrowser(uri);
    } else {
      NavigationService.navigate(context, url, arguments: data);
    }
  }
}
