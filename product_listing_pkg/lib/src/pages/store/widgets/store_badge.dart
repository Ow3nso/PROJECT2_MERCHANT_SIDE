import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show ReadContext;

import '../../../controller/shop_controller.dart';
import 'store_stats_card.dart';

class StoreBadge extends StatelessWidget {
  const StoreBadge({
    super.key,
    required this.shopId,
  });

  final String shopId;

  @override
  Widget build(BuildContext context) {
    var badges = context.read<ShopController>().getStoreBadges(shopId);
    return Row(
      children: List.generate(
          badges.length,
          (index) {
        return Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: StoreQuickLink(
              data: badges[index],
            ),
          ),
        );
      }),
    );
  }
}
