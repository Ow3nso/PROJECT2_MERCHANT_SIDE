import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        Consumer,
        DefaultBackButton,
        DefaultIconBtn,
        Helpers,
        LuhkuAppBar,
        ProductFields,
        ReadContext,
        StyleColors,
        WatchContext;
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import 'package:product_listing_pkg/src/controller/review_controller.dart';
import '../../../../utils/app_util.dart';
import '../../../controller/shop_controller.dart';
import '../widgets/product_review.dart';
import '../widgets/store_shop_container.dart';

class StoreView extends StatelessWidget {
  const StoreView({super.key});
  static const routeName = 'store_view';

  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    Helpers.debugLog('[ARGS]$args');
    var shopController = context.read<ShopController>();
    var shopData = shopController.shops[args[ProductFields.shopId]];
    return Consumer<ProductController>(
        builder: (context, productController, _) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: LuhkuAppBar(
            appBarType: AppBarType.other,
            backAction: const DefaultBackButton(),
            title: Text(
              shopData?.name ?? '',
              style: TextStyle(
                fontWeight: FontWeight.w800,
                fontSize: 24,
                color: StyleColors.lukhuDark1,
              ),
            ),
            color: Theme.of(context).colorScheme.onPrimary,
            enableShadow: true,
            actions: [
              DefaultIconBtn(
                radius: 12,
                assetImage: AppUtil.iconFlag,
                packageName: AppUtil.packageName,
              ),
              const SizedBox(width: 8),
              DefaultIconBtn(
                radius: 12,
                assetImage: AppUtil.iconSend,
                packageName: AppUtil.packageName,
                onTap: () {},
              ),
              const SizedBox(width: 16),
            ],
            bottomHeight:kTextTabBarHeight,
            bottom: TabBar(
                indicatorColor: StyleColors.lukhuDark,
                labelColor: StyleColors.lukhuDark,
                labelStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                unselectedLabelColor: StyleColors.lukhuDark,
                unselectedLabelStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                tabs: const [
                  Tab(
                    text: 'Shop',
                  ),
                  Tab(
                    text: 'Reviews',
                  ),
                ]),
          ),
          body: TabBarView(children: [
            StoreShopContainer(
              sellerId: args[ProductFields.sellerId],
              userId: context.watch<ProductController>().userId,
              shopId: args[ProductFields.shopId],
              quickLinks: productController.storeQuickLinks,
              product: (index, value) =>
                  context.read<ProductController>().product(index, value),
            ),
            ProductReview(
              reviews: context.watch<ReviewController>().reviews,
              future: context.read<ReviewController>().getProductReview(productId: ''),
            ),
          ]),
        ),
      );
    });
  }
}
