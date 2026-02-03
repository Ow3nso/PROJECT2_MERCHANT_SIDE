import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultButton, NavigationService, ReadContext, Shop, StyleColors;
import 'package:product_listing_pkg/src/controller/shop_controller.dart';
import 'package:product_listing_pkg/src/widgets/content_loader.dart';
import '../../utils/app_util.dart';
import '../pages/store/pages/boosted_store_view.dart';
import 'boosted_store_tile.dart';

class BoostedStores extends StatelessWidget {
  const BoostedStores({
    super.key,
    this.stores = const {},
  });
  final Map<String, Shop> stores;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: stores.isNotEmpty ? 245 : 0,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(
            width: 16,
          ),
          FutureBuilder(
              future: context.read<ShopController>().getShops(limit: 5),
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  if (stores.isEmpty) {
                    return const ContentLoader();
                  }
                  return Row(
                    children: [
                      SizedBox(
                        height: stores.isNotEmpty ? 245 : 0,
                        child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            childAspectRatio: .84,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: stores.keys.length,
                          padding: const EdgeInsets.all(2),
                          itemBuilder: (context, index) {
                            var store = context
                                .read<ShopController>()
                                .shop(index, stores);
                            return BoostedStoreTile(
                              showCouple: true,
                              store: store!,
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 8,
                          right: 8,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: DefaultButton(
                                onTap: () {
                                  NavigationService.navigate(
                                      context, BoostedStoreView.routeName,
                                      arguments: {
                                        'title': 'Our Picks 🔥',
                                        'type': ListingType.normal
                                      });
                                },
                                color: StyleColors.lukhuBlue,
                                actionDissabledColor:
                                    StyleColors.lukhuDisabledButtonColor,
                                label: 'See All',
                                width: 160,
                                style: TextStyle(
                                    color: StyleColors.lukhuWhite,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 16),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                }
                return const ContentLoader();
              }),
        ],
      ),
    );
  }
}
