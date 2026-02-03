import 'dart:async';
import 'dart:io';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show FirebaseMessaging, NotificationSettings;
import 'dart:developer' as dev;

class PushNotificationService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;
  bool initialized = false;
  String? token;

  PushNotificationService();

  FirebaseMessaging get firebaseMessaging => _firebaseMessaging;

  Future<String?> init() async {
    if (!initialized) {
      if (Platform.isIOS) {
        _requestPermission();
      }
      // https://stackoverflow.com/questions/65056272/how-to-configure-firebase-messaging-with-latest-version-in-flutter
      //
      // _firebaseMessaging.configure(
      //   onMessage: (Map<String, dynamic> message) {
      //     dev.log("notification onMessage",
      //         error: message, time: DateTime.now());
      //     return;
      //   },
      //   onResume: (Map<String, dynamic> message) {
      //     dev.log("notification onMessage",
      //         error: message, time: DateTime.now());
      //     return;
      //   },
      //   onLaunch: (Map<String, dynamic> message) {
      //     dev.log("notification onMessage",
      //         error: message, time: DateTime.now());
      //     return;
      //   },
      // );

      token = await _firebaseMessaging.getToken();
      if (token != null) {
        initialized = true;
      }
      dev.log("token", error: token);
      return token;
    }
    return token;
  }

  Future<NotificationSettings> _requestPermission() {
    return _firebaseMessaging.requestPermission(
      sound: true,
      badge: true,
      alert: true,
      provisional: false,
    );
  }
}
