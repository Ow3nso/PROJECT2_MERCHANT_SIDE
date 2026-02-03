import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        FuturePermissionStatusGetters,
        Permission,
        PermissionActions,
        PermissionCheckShortcuts;

class UserNotificationController extends ChangeNotifier {
  bool _allowNotification = false;
  bool get allowNotification => _allowNotification;
  set allowNotification(bool value) {
    _allowNotification = value;
    notifyListeners();
  }

  UserNotificationController() {
    initPermission();
  }

  /// The function initializes the allowNotification variable by checking if the notification permission
  /// is granted.
  void initPermission() async {
    allowNotification = await Permission.notification.isGranted;
  }

  /// This function requests permission for notifications and updates the value of a boolean variable
  /// accordingly.
  void grantPermission() async {
    if (allowNotification) {
      allowNotification = await Permission.notification.request().isGranted;
    } else {
      allowNotification = await Permission.notification.request().isDenied;
    }
  }

  /// The function checks if the notification permission is granted and sets the allowNotification
  /// variable accordingly.
  void checkStatus() async {
    await Permission.notification.request();
  }
}
