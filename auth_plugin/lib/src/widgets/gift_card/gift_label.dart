import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show ReadContext, StyleColors;

import '../../controllers/gift/gifts_controller.dart';
import 'payment_icon.dart';

class GiftLabel extends StatelessWidget {
  const GiftLabel({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onPrimary,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: StyleColors.lukhuDividerColor),
        ),
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            const PaymentIcon(),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'KSh ${context.read<GiftsController>().selectedGiftLabel} Gift Card',
                style: TextStyle(
                    color: Theme.of(context).colorScheme.scrim,
                    fontWeight: FontWeight.w600,
                    fontSize: 14),
              ),
            ),
          ],
        ));
  }
}
