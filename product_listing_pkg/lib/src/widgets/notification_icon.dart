import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show NavigationService, StyleColors, WatchContext;
import 'package:product_listing_pkg/src/controller/notification_controller.dart';
import 'package:product_listing_pkg/src/pages/notification/pages/notification_view.dart';
import 'package:product_listing_pkg/utils/app_util.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
            onPressed: () {
              NavigationService.navigate(
                context,
                NotificationView.routeName,
              );
            },
            icon: Image.asset(
              AppUtil.notificationBell,
              package: AppUtil.packageName,
            )),
        if (context.watch<NotificationController>().hasNotiFications)
          Positioned(
              top: 15,
              right: 13,
              child: CircleAvatar(
                radius: 5,
                backgroundColor: StyleColors.pink,
              ))
      ],
    );
  }
}
