import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DiscountCard, ReadContext, StyleColors, WatchContext;
import 'package:product_listing_pkg/src/controller/location_controller.dart';
import '../../../../utils/app_util.dart';
import '../../../controller/checkout_controller.dart';

class LabelCard extends StatelessWidget {
  const LabelCard({super.key, this.onTap});
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(
        context.watch<CheckoutController>().checkoutLabels.length,
        (index) {
          var label = context.watch<CheckoutController>().checkoutLabels[index];
          return DiscountCard(
            packageName: AppUtil.packageName,
            onTap: () {
              context.read<CheckoutController>().selectedLabel = index;
              context.read<LocationController>().locationType = label['title'];
              if (onTap != null) {
                onTap!();
              }
            },
            width: 96,
            imageColor:
                context.watch<CheckoutController>().isLabelSelected(index)
                    ? StyleColors.white
                    : null,
            color: context.watch<CheckoutController>().isLabelSelected(index)
                ? StyleColors.pink
                : StyleColors.lukhuGrey,
            iconImage: label['image'],
            description: label['title'],
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 12,
              color: context.watch<CheckoutController>().isLabelSelected(index)
                  ? StyleColors.white
                  : StyleColors.gray90,
            ),
          );
        },
      ),
    );
  }
}
