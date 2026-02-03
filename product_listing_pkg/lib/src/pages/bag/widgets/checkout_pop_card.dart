import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show DefaultButton, ReadContext, StyleColors, WatchContext;

import '../../../../utils/app_util.dart';
import '../../../controller/checkout_controller.dart';
import 'checkout_process/delivery_tile_card.dart';
import 'list_container.dart';
import 'location_card.dart';

enum CheckoutPopType {
  address,
  pickup,
  addresses,
  newAddress,
  review,
  payment,
  none,
}

class CheckoutPopCard extends StatelessWidget {
  const CheckoutPopCard(
      {super.key,
      required this.title,
      required this.description,
      this.onTap,
      this.type = CheckoutPopType.address,
      this.height = 430,
      required this.label,
      this.callback});
  final String title;
  final String description;
  final void Function()? onTap;
  final CheckoutPopType type;
  final String label;
  final double height;
  final void Function()? callback;

  bool isSelected(BuildContext context) {
    return context.read<CheckoutController>().selectedTown.isNotEmpty &&
        context.read<CheckoutController>().selectedPoint.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Material(
      color: StyleColors.lukhuWhite,
      borderRadius: BorderRadius.circular(12),
      elevation: 3,
      child: AnimatedContainer(
        duration: AppUtil.animationDuration,
        height: context.watch<CheckoutController>().isActive ||
                View.of(context).viewInsets.bottom > 0.0
            ? 700
            : isSelected(context) && type == CheckoutPopType.pickup
                ? height + 120
                : height,
        width: size.width,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: type == CheckoutPopType.payment
                ? CrossAxisAlignment.start
                : CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: StyleColors.lukhuDark1,
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: StyleColors.lukhuGrey80,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              Expanded(
                child: ListView(
                  children: [
                    const SizedBox(height: 16),
                    ListContainer(
                      type: type,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              if (type == CheckoutPopType.addresses)
                DeliveryTileCard(
                  height: 44,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  onTap: callback,
                  iconSize: 14,
                  child: Text(
                    'Add new address',
                    style: TextStyle(
                      color: StyleColors.lukhuGrey80,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                    ),
                  ),
                ),
              const SizedBox(
                height: 16,
              ),
              if (isSelected(context) && type == CheckoutPopType.pickup)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Available Pickup Stores',
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        color: StyleColors.gray90,
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    LocationCard(
                      onTap: () {},
                      data: context
                          .watch<CheckoutController>()
                          .pickedLocations
                          .first,
                      isSelected:
                          context.watch<CheckoutController>().isStorePicked,
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                  ],
                ),
              DefaultButton(
                onTap: type == CheckoutPopType.pickup
                    ? context.read<CheckoutController>().isStorePicked
                        ? () {
                            Navigator.of(context).pop();
                          }
                        : null
                    : onTap,
                label: label,
                color: StyleColors.lukhuBlue,
                actionDissabledColor: StyleColors.buttonBlueDissabled,
                height: 40,
                width: size.width - 50,
                textColor: StyleColors.lukhuWhite,
              ),
              const SizedBox(
                height: 16,
              ),
              DefaultButton(
                onTap: () {
                  Navigator.of(context).pop();
                },
                label: 'Cancel',
                color: StyleColors.lukhuWhite,
                height: 40,
                width: size.width - 50,
                boarderColor: StyleColors.lukhuDividerColor,
                textColor: StyleColors.lukhuDark1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
