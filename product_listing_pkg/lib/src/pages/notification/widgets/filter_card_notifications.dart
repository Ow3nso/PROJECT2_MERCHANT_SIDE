import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Consumer, DefaultButton, StyleColors;
import 'package:product_listing_pkg/src/controller/notification_controller.dart';
import '../../../../utils/app_util.dart';
import '../../../widgets/filter_sort/filter_notification.dart';

enum NotificationType { notification, orders, other }

class FilterCardNotifications extends StatelessWidget {
  const FilterCardNotifications({
    super.key,
    this.label = 'View',
    this.title = '',
    this.description = '',
    this.assetImage,
    this.backgroundColor,
    required this.notificationType,
    this.height = 500,
    this.onTap,
  });

  final String label;
  final String? assetImage;
  final String title;
  final String description;
  final Color? backgroundColor;
  final double height;
  final NotificationType notificationType;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<NotificationController>(
        builder: (context, notificationController, _) {
      return Material(
        color: StyleColors.lukhuWhite,
        borderRadius: BorderRadius.circular(12),
        elevation: 1,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 16, top: 20),
          child: SizedBox(
            height: height,
            //width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: backgroundColor ?? StyleColors.lukhuError10,
                  child: Image.asset(
                    assetImage ?? AppUtil.sortIcon,
                    package: AppUtil.packageName,
                    height: 24,
                    width: 24,
                  ),
                ),
                const SizedBox(height: 16),
                Text(title,
                    style: TextStyle(
                      color: StyleColors.lukhuDark1,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    )),
                const SizedBox(height: 8),
                Text(description,
                    style: TextStyle(
                      color: StyleColors.lukhuGrey80,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    )),
                !notificationType.name.contains('other')
                    ? Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) {
                            var data =
                                getDataList(notificationController)[index];
                            return FilterNotification(
                              notificationType: notificationType,
                              data: data,
                              onChanged: (value) {
                                notificationController.checkStatus(
                                    index, notificationType.name);
                              },
                            );
                          },
                          itemCount: getDataList(notificationController).length,
                        ),
                      )
                    : const SizedBox(
                        height: 24,
                      ),
                DefaultButton(
                  onTap: () {
                    if (onTap != null) {
                      onTap!();
                    }
                    Navigator.of(context).pop();
                  },
                  color: StyleColors.lukhuBlue,
                  //actionDissabledColor: StyleColors.lukhuDisabledButtonColor,
                  label: label,
                  height: 40,
                  width: size.width,
                  style: TextStyle(
                      color: StyleColors.lukhuWhite,
                      fontWeight: FontWeight.w600,
                      fontSize: 16),
                ),
                const SizedBox(
                  height: 16,
                ),
                DefaultButton(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  label: 'Cancel',
                  color: StyleColors.lukhuWhite,
                  height: 40,
                  width: size.width - 50,
                  boarderColor: StyleColors.lukhuDividerColor,
                  textColor: StyleColors.lukhuDark1,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  List<Map<String, dynamic>> getDataList(
      NotificationController notificationController) {
    return (notificationType != NotificationType.notification
        ? notificationController.filterOrders
        : notificationController.filterNotifications);
  }
}
