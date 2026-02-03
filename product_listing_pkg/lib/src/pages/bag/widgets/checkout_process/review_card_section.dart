import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show StyleColors, WatchContext;
import 'package:product_listing_pkg/src/controller/location_controller.dart';
import 'package:product_listing_pkg/src/pages/bag/widgets/account_card.dart';

import '../../../../controller/checkout_controller.dart';
import '../checkout_pop_card.dart';
import '../delivery_options/user_location.dart';
import 'delivery_tile_card.dart';

class ReviewCardSection extends StatelessWidget {
  const ReviewCardSection({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<CheckoutController>();
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        color: StyleColors.lukhuWhite,
      ),
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            'Review your order details below',
            style: TextStyle(
              color: StyleColors.lukhuDark1,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          DeliveryTileCard(
            type: DeliveryCardType.review,
            color: StyleColors.lukhuGrey10,
            onTap: () {},
          ),
          const SizedBox(
            height: 16,
          ),
          if (context.watch<LocationController>().location != null)
            UserLocation(
              location: context.watch<LocationController>().location!,
              type: CheckoutPopType.review,
              color: StyleColors.lukhuBlue0,
            ),
          if (controller.hasChosenPayment)
            AccountCard(
            data: context.watch<CheckoutController>().chosenPaymentOption!,
            type: AccountCardType.review,
            backgroundColor: StyleColors.lukhuGrey10,
          )
        ],
      ),
    );
  }
}
