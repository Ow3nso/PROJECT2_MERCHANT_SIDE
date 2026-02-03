import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show HourGlass, ReadContext, StyleColors, WatchContext;
import 'package:product_listing_pkg/src/controller/checkout_controller.dart';
import 'package:product_listing_pkg/src/controller/location_controller.dart';

import '../delivery_options/home_pick_up.dart';
import '../delivery_options/shop_pick_up.dart';
import 'delivery_tile_card.dart';
import 'tab_title.dart';

class DeliveryCard extends StatelessWidget {
  const DeliveryCard({super.key, this.onTap});
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: ListView(
        children: [
          const SizedBox(
            height: 13,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DeliveryTileCard(
              onTap: () {},
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Container(
            padding: const EdgeInsets.only(top: 10),
            decoration: BoxDecoration(
              color: StyleColors.lukhuWhite,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: Text(
                    'Delivery Options',
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 12,
                      color: StyleColors.lukhuDark1,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: StyleColors.lukhuDark),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: TabBar(
                      //labelColor: StyleColors.lukhuDark,
                      onTap: (value) {
                        context
                            .read<CheckoutController>()
                            .selectedDeliveryIndex = value;
                      },
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 2,
                      indicator: BoxDecoration(
                        color: StyleColors.activeIndicator,
                        borderRadius:
                            context.watch<CheckoutController>().borderRadius,
                      ),
                      tabs: context
                          .watch<CheckoutController>()
                          .tabs
                          .asMap()
                          .map((key, value) => MapEntry(
                              key,
                              Tab(
                                height: 40,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: TabTitle(
                                    fontWeight: context
                                                .watch<CheckoutController>()
                                                .selectedDeliveryIndex ==
                                            key
                                        ? FontWeight.w700
                                        : FontWeight.w600,
                                    value: value,
                                    color: context
                                                .watch<CheckoutController>()
                                                .selectedDeliveryIndex ==
                                            key
                                        ? StyleColors.white
                                        : StyleColors.lukhuDark1,
                                  ),
                                ),
                              )))
                          .values
                          .toList(),
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: context.watch<LocationController>().uploading
                      ? const Center(
                          child: HourGlass(),
                        )
                      : TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [
                              HomePickUp(
                                onTap: onTap,
                              ),
                              const ShopPickUp()
                            ]),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
