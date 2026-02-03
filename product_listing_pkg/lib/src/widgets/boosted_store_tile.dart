import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        NavigationService,
        ProductFields,
        ReadContext,
        Shop,
        StyleColors,
        WatchContext;
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import 'package:product_listing_pkg/src/controller/shop_controller.dart';
import 'package:product_listing_pkg/utils/app_util.dart';
import '../pages/product/widgets/follow_button.dart';
import '../pages/store/pages/store_view.dart';
import '../pages/store/widgets/store_message.dart';
import 'content_loader.dart';
import 'product_image_holder.dart';

class BoostedStoreTile extends StatelessWidget {
  const BoostedStoreTile(
      {super.key,
      this.showCouple = false,
      this.limit = 2,
      required this.store,
      this.padding});

  final bool showCouple;
  final EdgeInsets? padding;
  final int limit;
  final Shop store;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding ?? const EdgeInsets.only(right: 8, bottom: 2),
      child: Material(
        color: StyleColors.lukhuWhite,
        borderRadius: BorderRadius.circular(10),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 8),
          child: SizedBox(
            width: 240,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Row(
                    children: [
                      Stack(
                        children: [
                          InkWell(
                            borderRadius: BorderRadius.circular(
                              showCouple ? 30 : 17,
                            ),
                            onTap: () {
                              context
                                  .read<ShopController>()
                                  .getStoresStats(store.shopId!);
                              NavigationService.navigate(
                                  context, StoreView.routeName,
                                  arguments: {
                                    'title': '@zenyeziko',
                                    ProductFields.shopId: store.shopId,
                                    ProductFields.sellerId: store.userId!
                                  });
                            },
                            child: CircleAvatar(
                              radius: showCouple ? 30 : 17,
                              backgroundColor: StyleColors.lukhuProfile,
                              backgroundImage: store.imageUrl != null
                                  ? NetworkImage(
                                      store.imageUrl ?? '',
                                    )
                                  : null,
                            ),
                          ),
                          if (store.isVerified ?? false)
                            Positioned(
                              bottom: 5,
                              right: -.8,
                              child: CircleAvatar(
                                radius: 9,
                                backgroundColor: StyleColors.lukhuWhite,
                                child: Image.asset(
                                  AppUtil.iconVerified,
                                  height: 12,
                                  width: 12,
                                  package: AppUtil.packageName,
                                ),
                              ),
                            )
                        ],
                      ),
                      SizedBox(width: showCouple ? 10 : 4),
                      Text(
                        store.name!,
                        style: TextStyle(
                          color: StyleColors.lukhuDark1,
                          fontWeight: FontWeight.w500,
                          fontSize: 17,
                        ),
                      ),
                      if (store.isVerified ?? false)
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Image.asset(
                            AppUtil.iconVerified,
                            height: 12,
                            width: 12,
                            color: StyleColors.pink.withOpacity(
                              .7,
                            ),
                            package: AppUtil.packageName,
                          ),
                        ),
                      const Spacer(),
                      FollowButton(

                        userId: context.watch<ProductController>().userId,
                        shopId: store.shopId!,
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                FutureBuilder(
                    future: context
                        .read<ShopController>()
                        .getStoreProduct(userId: store.userId!, limit: limit),
                    builder: (_, snapshot) {
                      if (snapshot.hasData) {
                        var products = snapshot.data;
                        if (products!.isEmpty) {
                          return SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: 117,
                            child: const StoreMessage(
                                text:
                                    'This shop has not uploaded any products yet'),
                          );
                        }
                        return Row(
                          children: List.generate(
                            products.keys.length,
                            (i) => Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: ProductImageHolder(
                                  product: context
                                      .read<ProductController>()
                                      .product(i, products),
                                  width: showCouple ? 117 : 114,
                                  height: showCouple ? 117 : 135,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        );
                      }
                      return const ContentLoader();
                    })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
