import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show DeliveryStatus, StyleColors, GlobalAppUtil;

class StatusCard extends StatelessWidget {
  const StatusCard(
      {super.key, required this.type, this.isRead = false});
  final DeliveryStatus type;
  final bool isRead;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
          color: isRead
              ? StyleColors.lukhuGrey10
              : GlobalAppUtil.deliveryTextColor(type)!.first,
          borderRadius: BorderRadius.circular(25)),
      child: Text(
        GlobalAppUtil.getStatusName(type),
        style: TextStyle(
            color: isRead
                ? StyleColors.lukhuGrey70
                : GlobalAppUtil.deliveryTextColor(type)!.last,
            fontSize: 14,
            fontWeight: FontWeight.w500),
      ),
    );
  }
}
