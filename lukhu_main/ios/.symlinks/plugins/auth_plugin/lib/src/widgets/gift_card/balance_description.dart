import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show StyleColors;

import 'gift_text.dart';

class BalanceTile extends StatelessWidget {
  const BalanceTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border.symmetric(
              horizontal: BorderSide(
        color: StyleColors.lukhuDividerColor,
      ))),
      child: Column(
        children: [
          const GiftText(
            title: 'Available Balance: ',
            description: 'KSh 400',
            alignment: MainAxisAlignment.center,
          ),
          Divider(color: StyleColors.lukhuDividerColor),
          const GiftText(
            alignment: MainAxisAlignment.center,
            title: 'Balance Needed: ',
            description: 'KSh 100',
          ),
        ],
      ),
    );
  }
}
