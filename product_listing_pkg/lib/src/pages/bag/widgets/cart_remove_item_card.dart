import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultButton, StyleColors;
import 'package:product_listing_pkg/utils/app_util.dart';

class CartRemoveItemCard extends StatelessWidget {
  const CartRemoveItemCard({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: 300,
      width: size.width,
      padding: const EdgeInsets.only(left: 16, top: 20, right: 16, bottom: 1),
      decoration: BoxDecoration(
          color: StyleColors.lukhuWhite,
          border: Border.all(color: StyleColors.lukhuDividerColor),
          borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: StyleColors.lukhuError10,
            radius: 28,
            child: Image.asset(
              AppUtil.iconAlert,
              height: 24,
              width: 24,
              package: AppUtil.packageName,
            ),
          ),
          const SizedBox(height: 16),
          Text('Remove Item',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: StyleColors.lukhuDark1,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              )),
          const SizedBox(height: 8),
          Text(
            'Are you sure you want to remove this item?',
            textAlign: TextAlign.center,
            style: TextStyle(
                wordSpacing: 2,
                color: StyleColors.lukhuGrey80,
                fontSize: 14,
                fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 8),
          DefaultButton(
            onTap: onTap,
            label: 'Yes, remove it!',
            color: StyleColors.lukhuError,
            height: 40,
            width: size.width - 32,
            textColor: StyleColors.lukhuWhite,
          ),
          const SizedBox(height: 12),
          DefaultButton(
            onTap: () {
              Navigator.of(context).pop();
            },
            label: 'Cancel',
            color: StyleColors.lukhuWhite,
            height: 40,
            width: size.width - 32,
            boarderColor: StyleColors.lukhuDividerColor,
            textColor: StyleColors.lukhuDark1,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
