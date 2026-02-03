import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        ChatService,
        DefaultIconBtn,
        Product,
        ReadContext,
        StyleColors,
        WatchContext;
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import 'package:product_listing_pkg/src/controller/shop_controller.dart';
import 'package:product_listing_pkg/src/pages/product/widgets/follow_button.dart';
import '../../../../utils/app_util.dart';
import '../../../widgets/product_image_holder.dart';
import '../../../widgets/profile_card.dart';
import 'store_badge.dart';
import 'store_message.dart';
import 'store_stats_card.dart';

class StoreShopContainer<T> extends StatefulWidget {
  const StoreShopContainer(
      {super.key,
      this.quickLinks = const [],
      required this.product,
      required this.shopId,
      this.userId,
      required this.sellerId});
  final List<Map<String, dynamic>> quickLinks;
  final Product? Function(int, Map<String, Product>) product;
  final String shopId;
  final String? userId;
  final String sellerId;

  @override
  State<StoreShopContainer<T>> createState() => _StoreShopContainerState<T>();
}

class _StoreShopContainerState<T> extends State<StoreShopContainer<T>> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var shopController = context.read<ShopController>();
    var hasBadge =
        context.read<ShopController>().getStoreBadges(widget.shopId).isNotEmpty;
    var products =
        context.watch<ProductController>().sellerProuducts[widget.sellerId] ??
            {};
    return FutureBuilder(
        future: context
            .read<ShopController>()
            .getUserShop(shopId: widget.shopId, isRefreshMode: true),
        builder: (_, snapshot) {
          var shop = shopController.userShops[widget.shopId]?[widget.shopId];
          if (shop == null) {
            return Center(
              child: Text(
                'Shop data is not available at the moment.',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.scrim,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),
            );
          }
          return SizedBox(
              height: size.height,
              child: RefreshIndicator(
                onRefresh: () {
                  return getShop(context, shop.userId!);
                },
                child: CustomScrollView(
                  slivers: [
                    SliverAppBar(
                      automaticallyImplyLeading: false,
                      primary: true,
                      stretch: true,
                      floating: true,
                      expandedHeight: hasBadge ? 300.0 : 200,
                      flexibleSpace: FlexibleSpaceBar(
                        expandedTitleScale: 1,
                        centerTitle: true,
                        title: ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          children: [..._views],
                        ),
                      ),
                    ),
                    if (products.isNotEmpty)
                      SliverGrid.builder(
                        itemCount: products.keys.length,
                        itemBuilder: (context, index) => ProductImageHolder(
                          width: 160,
                          height: 170,
                          product: widget.product(index, products),
                          fit: BoxFit.cover,
                        ),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          childAspectRatio: 1.08,
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 8,
                        ),
                      ),
                    if (products.isEmpty)
                      SliverList(
                        delegate: SliverChildListDelegate([
                          Container(
                            height: 200,
                            alignment: Alignment.center,
                            child: const StoreMessage(text: 'This shop has not uploaded any products yet'),
                          )
                        ]),
                      )
                  ],
                ),
              ));
        });
  }

  Future<void> getShop(BuildContext context, String sellerId) async {
    context
        .read<ShopController>()
        .getUserShop(shopId: widget.shopId, isRefreshMode: true);
    context.read<ProductController>().getMoreProductsFromSeller(
        limit: 8, sellerId: widget.sellerId, isrefreshMode: true);
  }

  List<Widget> get _views => [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: ProfileCard(
            shopId: widget.shopId,
            type: ViewTitleType.verified,
            radius: 32,
            trailing: SizedBox(
              width: 110,
              child: Row(
                children: [
                  FollowButton(
                    userId: context.watch<ProductController>().userId,
                    shopId: widget.shopId,
                    width: 68,
                  ),
                  const SizedBox(width: 10),
                  DefaultIconBtn(
                    radius: 12,
                    assetImage: AppUtil.iconMessages,
                    packageName: AppUtil.packageName,
                    onTap: () {
                      ChatService.openChat(
                          recipientId: context
                              .read<ShopController>()
                              .shops[widget.shopId]!
                              .userId!);
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: List.generate(
                context.watch<ShopController>().storeStats.length, (index) {
              var stats = context.watch<ShopController>().storeStats[index];
              return Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: StoreStatsCard(
                    description: stats['description'],
                    title: stats['title'],
                    child: index == 0
                        ? Row(
                            children: List.generate(
                                5,
                                (index) => Icon(Icons.star,
                                    size: 8,
                                    color: index == 4
                                        ? StyleColors.lukhuDividerColor
                                        : StyleColors.rateColor)),
                          )
                        : null,
                  ),
                ),
              );
            })),
        Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 16),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: StyleColors.lukhuGrey10,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
                context
                    .read<ShopController>()
                    .shops[widget.shopId]!
                    .description!,
                style: TextStyle(
                    color: StyleColors.lukhuDark,
                    fontWeight: FontWeight.w400,
                    fontSize: 11)),
          ),
        ),
        if (context
            .read<ShopController>()
            .getStoreBadges(widget.shopId)
            .isNotEmpty)
          StoreBadge(shopId: widget.shopId)
      ];
}
