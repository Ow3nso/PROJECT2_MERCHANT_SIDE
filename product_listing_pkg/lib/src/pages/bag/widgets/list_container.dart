import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show Consumer;
import 'package:product_listing_pkg/src/controller/checkout_controller.dart';

import 'checkout_pop_card.dart';
import 'location_container.dart';
import 'map_card.dart';
import 'payment_card.dart';
import 'pick_location.dart';

class ListContainer extends StatelessWidget {
  const ListContainer({super.key, this.type = CheckoutPopType.pickup});
  final CheckoutPopType type;

  @override
  Widget build(BuildContext context) {
    
    return Consumer<CheckoutController>(
      builder: (context, checkoutController, child) {
        switch (type) {
          case CheckoutPopType.pickup:
            return Column(
              children: List.generate(checkoutController.pickUpPoints.length,
                  (index) {
                var pickUpPoint = checkoutController.pickUpPoints[index];
                return PickLocation(
                  data: pickUpPoint,
                  index: index,
                  onTap: () {
                    checkoutController.togglePoint(index);
                  },
                );
              }),
            );
          case CheckoutPopType.address:
            return MapCard(
              type: type,
            );
          case CheckoutPopType.newAddress:
            return MapCard(
              type: type,
            );
          case CheckoutPopType.addresses:
            return const LocationContainer();

          case CheckoutPopType.payment:
            return const PaymentCard();

          default:
            return Container();
        }
      },
    );
  }
}

