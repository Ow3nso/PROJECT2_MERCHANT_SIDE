import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show CardOfferViewType, Consumer, DeliveryStatus, NavigationService, StyleColors;
import 'package:product_listing_pkg/src/controller/order_controller.dart';
import '../../../widgets/offers/card_offer_tile.dart';
import '../pages/order_view.dart';

class OrdersContainer extends StatelessWidget {
  const OrdersContainer({
    super.key,
    this.isRead = false,
    this.title = '',
  });
  final bool isRead;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Consumer<OrderController>(builder: (context, orderController, _) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: StyleColors.lukhuDark1,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: orderController.orders
                .where((value) => value['isRead'] == isRead)
                .toList()
                .length,
            itemBuilder: (context, index) {
              var data = orderController.orders
                  .where((value) => value['isRead'] == isRead)
                  .toList()[index];
              return CardOfferTile(
                data: data,
                onTap: () {
                  orderController.markAllAsRead();
                  NavigationService.navigate(
                    context,
                    OrderView.routeName,
                    arguments: data,
                  );
                },
                type: CardOfferViewType.order,
                statusType: data['type'] as DeliveryStatus,
              );
            },
          )
        ],
      );
    });
  }
}
