import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultCheckbox, StyleColors, DeliveryStatus;
import '../../pages/notification/widgets/filter_card_notifications.dart';
import '../offers/delivery_status_card.dart';

class FilterNotification extends StatelessWidget {
  const FilterNotification(
      {super.key,
      required this.data,
      required this.onChanged,
      required this.notificationType});
  final Map<String, dynamic> data;
  final void Function(bool?) onChanged;
  final NotificationType notificationType;

  @override
  Widget build(BuildContext context) {
    return DefaultCheckbox(
      value: data['isChecked'] as bool,
      activeColor: StyleColors.lukhuBlue10,
      checkedColor: StyleColors.lukhuBlue70,
      title: notificationType == NotificationType.notification
          ? Text(
              data['description'],
              style: TextStyle(
                color: StyleColors.gray90,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            )
          : Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              StatusCard(
                width: 80,
                type: data['type'] as DeliveryStatus,
              ),
              Text(
                data['description'],
                style: TextStyle(
                    color: StyleColors.lukhuGrey80,
                    fontWeight: FontWeight.w500,
                    fontSize: 14),
              )
            ]),
      onChanged: onChanged,
    );
  }
}
