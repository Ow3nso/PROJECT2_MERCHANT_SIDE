import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show NavigationService, ReadContext;

import '../../controllers/gift/gifts_controller.dart';
import '../../pages/buy_gift.dart';
import 'gift_tile.dart';

class GiftContainer extends StatelessWidget {
  const GiftContainer(
      {super.key, this.label, this.items = const [], this.color});
  final String? label;
  final List<Map<String, dynamic>> items;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: color ?? Theme.of(context).colorScheme.onPrimary,
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label != null)
            Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Text(
                label ?? '',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.scrim,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: .764,
              crossAxisSpacing: 16,
              mainAxisSpacing: 8,
            ),
            itemBuilder: (context, index) {
              var data = items[index];
              return GiftTile(
                data: data,
                onTap: () {
                  context.read<GiftsController>().setGift(data['value']);
                  NavigationService.navigate(context, BuyGiftPage.routeName,
                      arguments: {
                        'gift': data,
                      });
                },
              );
            },
            itemCount: items.length,
          )
        ],
      ),
    );
  }
}
