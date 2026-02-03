import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show DefaultSwitch, ReadContext, StyleColors, WatchContext;
import 'package:product_listing_pkg/src/controller/checkout_controller.dart';

import '../../../../../utils/dialogues.dart';

import '../checkout_pop_card.dart';
import '../checkout_process/delivery_tile_card.dart';
import '../location_card.dart';

class ShopPickUp extends StatelessWidget {
  const ShopPickUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (!context.watch<CheckoutController>().shouldPickStore)
          Padding(
            padding: const EdgeInsets.only(
              left: 16,
              top: 16,
              right: 16,
            ),
            child: context.watch<CheckoutController>().isStorePicked
                ? Column(
                    children: [
                      LocationCard(
                        data: context
                            .watch<CheckoutController>()
                            .pickedLocations
                            .first,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor: StyleColors.lukhuDark,
                          child: InkWell(
                            onTap: () {
                              context.read<CheckoutController>().isStorePicked =
                                  false;
                            },
                            child: Icon(
                              Icons.close,
                              color: StyleColors.lukhuWhite,
                              size: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : DeliveryTileCard(
                    height: 44,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 14, vertical: 10),
                    onTap: () {
                      LukhuDialogue.blurredDialogue(
                        context: context,
                        distance: 80,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: CheckoutPopCard(
                            type: CheckoutPopType.pickup,
                            height: 350,
                            title: 'Select pickup point',
                            label: 'View Pickup Stores',
                            description:
                                'Pick the ideal pickup store for you and we will deliver your item there in 2 days max.',
                            onTap: isSelected(context) &&
                                    context
                                        .read<CheckoutController>()
                                        .isStorePicked
                                ? () {}
                                : null,
                          ),
                        ),
                      );
                    },
                    iconSize: 14,
                    child: Text(
                      'Pickup Store',
                      style: TextStyle(
                        color: StyleColors.lukhuGrey80,
                        fontWeight: FontWeight.w400,
                        fontSize: 14,
                      ),
                    ),
                  ),
          ),
        const SizedBox(
          height: 16,
        ),
        Divider(color: StyleColors.lukhuDividerColor),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DefaultSwitch(
            value: context.watch<CheckoutController>().shouldPickStore,
            onChanged: (value) {
              context.read<CheckoutController>().shouldPickStore =
                  value ?? false;
            },
            activeColor: StyleColors.lukhuBlue,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Store Pickup',
                  style: TextStyle(
                    color: StyleColors.gray90,
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                Text(
                  'Pick your item at the seller’s store.',
                  style: TextStyle(
                    color: StyleColors.lukhuGrey70,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ),
        Divider(color: StyleColors.lukhuDividerColor),
      ],
    );
  }

  bool isSelected(BuildContext context) {
    return context.read<CheckoutController>().selectedTown.isNotEmpty &&
        context.read<CheckoutController>().selectedPoint.isNotEmpty;
  }
}
