import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart';

import '../../utils/app_util.dart';

class PaymentIcon extends StatelessWidget {
  const PaymentIcon({super.key, this.height = 32, this.width = 46});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: StyleColors.lukhuOrange200,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Image.asset(
        AppUtil.paymentIcon,
        package: AppUtil.packageName,
      ),
    );
  }
}
