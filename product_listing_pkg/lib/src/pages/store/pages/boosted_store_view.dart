import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        DefaultBackButton,
        DefaultIconBtn,
        LuhkuAppBar,
        ReadContext,
        StyleColors,
        WatchContext;
import 'package:product_listing_pkg/src/controller/shop_controller.dart';

import '../../../../utils/app_util.dart';
import '../../../widgets/boosted_store_tile.dart';
import '../../../widgets/cart_icon.dart';
import '../../../widgets/content_loader.dart';

class BoostedStoreView extends StatelessWidget {
  const BoostedStoreView({super.key});
  static const routeName = 'boosted_store_view';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = context.watch<ShopController>();
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        height: 100,
        color: Theme.of(context).colorScheme.onPrimary,
        enableShadow: true,
        backAction: const DefaultBackButton(),
        title: Text(
          'Boosted Stores 🚀',
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: StyleColors.lukhuDark1,
          ),
        ),
        actions: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: DefaultIconBtn(
                radius: 12,
                onTap: () {},
                assetImage: AppUtil.iconSearch,
                packageName: AppUtil.packageName,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: DefaultIconBtn(
                onTap: () {},
                radius: 12,
                assetImage: AppUtil.iconSend,
                packageName: AppUtil.packageName,
              ),
            ),
          ),
          const Expanded(
            child: Padding(
              padding: EdgeInsets.only(right: 16),
              child: CartIcon(),
            ),
          ),
        ],
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: RefreshIndicator(
          onRefresh: () {
            return getShops(context);
          },
          child: ListView(
            shrinkWrap: true,
            children: [
              Container(
                height: 100,
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(color: StyleColors.boostedStoreBackground),
                child: Text(
                  'CTA for Subscription',
                  style: TextStyle(
                      color: StyleColors.lukhuDark,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
              ),
              FutureBuilder(
                future: context.read<ShopController>().getShops(limit: 10),
                builder: (_, snapshot) {
                  if (snapshot.hasData) {
                    if (context.watch<ShopController>().shops.isEmpty) {
                      return const ContentLoader();
                    }

                    return ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(top: 16),
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (_, index) {
                        var store = context
                            .read<ShopController>()
                            .shop(index, controller.shops);
                        return BoostedStoreTile(
                          limit: 3,
                          padding: const EdgeInsets.only(
                              left: 16, right: 16, bottom: 8),
                          store: store!,
                        );
                      },
                      itemCount:
                          context.watch<ShopController>().shops.keys.length,
                    );
                  }
                  return const ContentLoader();
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> getShops(BuildContext context) async {
    context.read<ShopController>().getShops(limit: 10, isRefreshMode: true);
  }
}
