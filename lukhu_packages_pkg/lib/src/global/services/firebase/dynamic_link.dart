import 'dart:developer';

import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../lukhu_packages_pkg.dart'
    show
        Logger,
        NavigationService,
        PackageInfo,
        ShortMessageType,
        ShortMessages;

class DynamicLinkServices {
  final logger = Logger();

  FirebaseDynamicLinks dynamicLinks = FirebaseDynamicLinks.instance;

  /// It listens to the dynamic link and handles the navigation.
  void init() {
    dynamicLinks.onLink.listen((dynamicLinkData) {
      handleLinkNavigation(dynamicLinkData);
    }).onError((error) {
      final e = 'An error occured | Type => dynamicLinks , Error => $error ';
      if (kDebugMode) {
        log(e);
      }
      ShortMessages.showShortMessage(
          type: ShortMessageType.error,
          message: "The link is not valid. Please try again later.");
      logger.logWarn(e);
    });
  }

  /// If the user opens the app from a dynamic link, navigate to the path specified in the dynamic link
  ///
  /// Args:
  ///   dynamicLinkData (PendingDynamicLinkData): This is the data that is passed to the app when the app
  /// is opened from a dynamic link.
  void handleLinkNavigation(PendingDynamicLinkData dynamicLinkData) {
    BuildContext context = NavigationService.navigatorKey.currentContext!;
    final params = dynamicLinkData.link.queryParameters;
    if (params['link'] == null) {
      ShortMessages.showShortMessage(
          message: "The link seems to be broken or invalid");
      return;
    }
    final uri = Uri.parse(params['link']!);
    final path = uri.path;
    final appParams = uri.queryParameters;
    if (kDebugMode) {
      log('navigating via dynamicLink to -> $path');
      log("passed params -> ${params.toString()}");
    }
    // for now we will remove the first slash or else the navigation service will not work, should be fixed in the future
    NavigationService.navigate(context, path.replaceAll('/', ''),
        arguments: appParams);
  }

  /// Creates a dynamic link and returns the link as a string
  static Future<String> createLink({
    /// The context of the current page
    required BuildContext context,

    /// The path to navigate to when the link is clicked
    required String appPath,

    /// The title of the link
    required String title,

    /// The description of the link
    required String description,

    /// The parameters to pass to the link
    Map<String, String>? params,

    /// The media url to pass to the link
    String? mediaUrl,
  }) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();

    String pageLink = "lukhu.page.link";
    String rawUrl = "https://$pageLink/$appPath?";
    Uri rawUri = Uri.parse(rawUrl);
    if (params != null) {
      rawUri = rawUri.replace(queryParameters: params);
    }
    const weblink = "https://lukhu.co.ke?";
    Uri weblinkUri = Uri.parse(weblink);
    if (params != null) {
      weblinkUri = weblinkUri.replace(queryParameters: params);
    }
    String longUrl =
        "https://$pageLink/?link=${rawUri.toString()}&ofl=${weblinkUri.toString()}";
    final dynamicLinkParams = DynamicLinkParameters(
      link: Uri.parse(longUrl),
      uriPrefix: "https://$pageLink",
      androidParameters: AndroidParameters(
        packageName: packageInfo.packageName,
      ),
      iosParameters: IOSParameters(
        appStoreId: "1631760194",
        bundleId: packageInfo.packageName,
      ),
      socialMetaTagParameters: SocialMetaTagParameters(
        title: title,
        description: description,
        imageUrl: mediaUrl != null ? Uri.parse(mediaUrl) : null,
      ),
    );
    final dynamicLink =
        await FirebaseDynamicLinks.instance.buildShortLink(dynamicLinkParams);
    final link = dynamicLink.shortUrl.toString();

    return link;
  }
}
