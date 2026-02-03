import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show DefaultButton, StyleColors;
import 'package:product_listing_pkg/utils/app_util.dart';

class CartMessage extends StatelessWidget {
  const CartMessage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 29,
          backgroundColor: StyleColors.lukhuError10,
          child: Image.asset(
            AppUtil.bagCross,
            package: AppUtil.packageName,
          ),
        ),
        Text(
          'Your bag is empty 😢',
          textAlign: TextAlign.center,
          style: TextStyle(
              color: StyleColors.lukhuDark1,
              fontSize: 16,
              fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8),
        Text(
          'Browse and discover amazing outfits!',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondary,
            fontWeight: FontWeight.w400,
            fontSize: 14,
          ),
        ),
        const SizedBox(height: 24),
        DefaultButton(
          label: 'Shop Now',
          height: 44,
          onTap: () {
            Navigator.popUntil(
              context,
              (route) => route.isFirst,
            );
          },
          color: StyleColors.lukhuBlue,
          width: MediaQuery.sizeOf(context).width - 32,
        ),
      ],
    );
  }
}
