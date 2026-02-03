import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Consumer, DefaultCheckbox, StyleColors;
import 'package:product_listing_pkg/src/controller/checkout_controller.dart';

import '../../../../utils/app_util.dart';
import 'checkout_pop_card.dart';

class LocationCard extends StatelessWidget {
  const LocationCard(
      {super.key,
      this.onTap,
      this.isSelected = false,
      this.child,
      this.type = CheckoutPopType.pickup,
      this.data,
      this.backgroundColor,
      this.callback});
  final void Function()? onTap;
  final bool isSelected;
  final Widget? child;
  final CheckoutPopType type;
  final Map<String, dynamic>? data;
  final Color? backgroundColor;
  final void Function()? callback;

  @override
  Widget build(BuildContext context) {
    var selectedLocation = data!['isSelected'] ?? false;
    var image = data!['image'] != '' ? data!['image'] : AppUtil.shopBanner;
    return Consumer<CheckoutController>(
        builder: (context, checkoutController, _) {
      return Container(
        decoration: BoxDecoration(
          color: backgroundColor ??
              (!isSelected ? StyleColors.lukhuWhite : StyleColors.lukhuBlue0),
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: StyleColors.lukhuDividerColor,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundColor: backgroundColor != null
                      ? StyleColors.lukhuWhite
                      : isSelected
                          ? StyleColors.lukhuWhite
                          : StyleColors.lukhuBlue0,
                  radius: 16,
                  child: Image.asset(image,
                      package: AppUtil.packageName,
                      color: StyleColors.lukhuBlue,
                      height: 13),
                ),
                const SizedBox(
                  width: 9,
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (type == CheckoutPopType.review)
                            Text(
                              'Shipping Details',
                              style: TextStyle(
                                color: StyleColors.lukhuGrey60,
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            ),
                          Text(
                            data!['type'],
                            style: TextStyle(
                              color: isSelected
                                  ? StyleColors.lukhuBlue
                                  : StyleColors.gray90,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                          Text(
                            data!['place'],
                            style: TextStyle(
                              color: isSelected
                                  ? StyleColors.lukhuBlue
                                  : StyleColors.gray90,
                              fontWeight: FontWeight.w400,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            data!['phone'],
                            style: TextStyle(
                              color: isSelected
                                  ? StyleColors.lukhuBlue
                                  : StyleColors.lukhuGrey80,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                          if (type == CheckoutPopType.review)
                            InkWell(
                              onTap: callback,
                              child: Text(
                                'Edit',
                                style: TextStyle(
                                    color: StyleColors.lukhuBlue,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                            )
                        ],
                      ),
                      child ??
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: DefaultCheckbox(
                                activeColor: StyleColors.lukhuBlue10,
                                checkedColor: StyleColors.lukhuBlue70,
                                controlAffinity:
                                    ListTileControlAffinity.trailing,
                                value: type == CheckoutPopType.pickup
                                    ? checkoutController.isStorePicked
                                    : selectedLocation,
                                onChanged: (value) {
                                  if (type == CheckoutPopType.pickup) {
                                    checkoutController.isStorePicked =
                                        value ?? false;
                                  } else {
                                    
                                  }
                                },
                              ),
                            ),
                          )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
