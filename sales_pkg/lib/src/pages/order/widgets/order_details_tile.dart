// order_details_page.dart
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AppBarType, DefaultBackButton, DefaultCallBtn, LuhkuAppBar, OrderModel;
import 'order_tile.dart'; // Import OrderTileCard

class OrderDetailsPage extends StatelessWidget {
  const OrderDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Retrieve order details from the arguments
    final OrderModel order = ModalRoute.of(context)!.settings.arguments as OrderModel;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: LuhkuAppBar(
          backAction: const DefaultBackButton(),
          appBarType: AppBarType.other,
          enableShadow: true,
          height: 105,
          color: Theme.of(context).colorScheme.onPrimary,
          title: Text(
            'Order Details',
            style: TextStyle(
              color: Theme.of(context).colorScheme.scrim,
              fontWeight: FontWeight.w800,
              fontSize: 24,
            ),
          ),
          actions: const [
            Padding(
              padding: EdgeInsets.only(right: 16),
              child: DefaultCallBtn(),
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: OrderTileCard(order: order), // Display the order details
            ),
          ],
        ),
      ),
    );
  }
}
