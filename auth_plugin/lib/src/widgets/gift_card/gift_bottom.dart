import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show BottomCard, ReadContext, StyleColors;

import '../../controllers/gift/gifts_controller.dart';
import 'gift_text.dart';

class GiftBottom extends StatelessWidget {
  const GiftBottom({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: 180,
      child: Column(
        children: [
          Container(
            width: size.width,
            decoration: BoxDecoration(
                color: StyleColors.lukhuGrey10,
                border: Border.symmetric(
                    horizontal: BorderSide(
                  color: StyleColors.lukhuDividerColor,
                ))),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: GiftText(
              alignment: MainAxisAlignment.spaceBetween,
              title: 'Total',
              titleWeight: FontWeight.w700,
              description:
                  'KSh ${context.read<GiftsController>().selectedGiftLabel}',
            ),
          ),
          BottomCard(
            label: 'Complete Order',
            onTap: onTap,
          ),
        ],
      ),
    );
  }
}
