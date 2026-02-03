import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show NavigationService;

enum ShortMessageType {
  /// Success type, uses green color, to show successful outcome
  success,
  /// Error type, uses red color, to show failure
  error,
  /// Warning type, uses orange color, to show potenstial failure
  warning,
  /// Info type, uses blue color, to show important info
  info,
  /// Default type, uses theme color
  defaultType,
}
class ShortMessages{
  static void showShortMessage(
       {ShortMessageType type = ShortMessageType.defaultType  ,required String message}) {
    BuildContext? context = NavigationService.navigatorKey.currentContext;
    if(context == null) return;
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message, style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
        ),
        backgroundColor: _getShortMessageColor(type),
      ),
    );
  }

  static Color? _getShortMessageColor(ShortMessageType type) {
    switch (type) {
      case ShortMessageType.success:
        return Colors.green;
      case ShortMessageType.error:
        return Colors.red;
      case ShortMessageType.warning:
        return Colors.orange;
      case ShortMessageType.info:
        return Colors.blue;
      case ShortMessageType.defaultType:
        return null;
    }
  }
}