import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show NavigationService, ReadContext, WatchContext;
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import 'package:product_listing_pkg/src/controller/shop_controller.dart';
import 'package:product_listing_pkg/utils/app_util.dart';

import '../../../widgets/boosted_store.dart';
import '../../../widgets/boosted_store_banner.dart';
import '../../product/pages/product_listing_view.dart';
import '../../store/pages/boosted_store_view.dart';
import '../widgets/category_section.dart';
import '../widgets/intro_tile_section_banner.dart';
import '../widgets/items_loved.dart';
import '../widgets/our_picks.dart';
import '../widgets/picked_items.dart';

class ForYouView extends StatefulWidget {
  const ForYouView({
    super.key,
  });

  @override
  State<ForYouView> createState() => _ForYouViewState();
}

class _ForYouViewState extends State<ForYouView>
    with AutomaticKeepAliveClientMixin<ForYouView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ProductController>().getUserLoggedIn();
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    var size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: ListView.builder(
        itemCount: _views.length,
        itemBuilder: (context, index) => _views[index],
      ),
    );
  }

  List<Widget> get _views => [
        const IntroTileSectionBanner(),
        const SizedBox(
          height: 12,
        ),
        CategorySection(
          categoryData: AppUtil.categoryData,
        ),
        Padding(
          padding: const EdgeInsets.only(top: 12, bottom: 8),
          child: PickedItems(
            title: 'Picked for You ⚡️',
            product: context.watch<ProductController>().pickedForYou,
            future: context.read<ProductController>().getPickedForYou(),
            onTap: () {
              NavigationService.navigate(context, ProductListingView.routeName,
                  arguments: {
                    'title': 'Picked for You ⚡️',
                    'type': ListingType.normal
                  });
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CategoryContainer(
            title: 'Item You Loved',
            future: context.read<ProductController>().getUserLovedItem(),
            onTap: () {
              NavigationService.navigate(context, ProductListingView.routeName,
                  arguments: {
                    'title': 'Item You Loved',
                    'type': ListingType.normal
                  });
            },
            products: context.watch<ProductController>().itemsLoved,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 8),
          child: CategoryContainer(
            future: context.read<ProductController>().getRecentlyViewed(),
            title: 'Recently Viewed Items 👀',
            onTap: () {
              NavigationService.navigate(context, ProductListingView.routeName,
                  arguments: {
                    'title': 'Recently Viewed Items 👀',
                    'type': ListingType.normal
                  });
            },
            products: const {},
          ),
        ),
        if (context.watch<ShopController>().shops.isNotEmpty)
          BoostedStoreBanner(
            backgroundBanner: AppUtil.backgroundBanner,
            shopBanner: AppUtil.shopBanner,
            onCallback: () {
              NavigationService.navigate(context, BoostedStoreView.routeName,
                  arguments: {
                    'title': 'Our Picks 🔥',
                    'type': ListingType.normal
                  });
            },
          ),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: BoostedStores(
            stores: context.watch<ShopController>().shops,
          ),
        ),
        OurPicks(
          product: (index, value) =>
              context.read<ProductController>().product(index, value),
          future: context.read<ProductController>().getOurPicks(limit: 6),
          title: 'Our Picks 🔥',
          products: context.watch<ProductController>().ourPicks,
          onTap: () {
            NavigationService.navigate(context, ProductListingView.routeName,
                arguments: {
                  'title': 'Our Picks 🔥',
                  'type': ListingType.normal
                });
          },
        )
      ];

  @override
  bool get wantKeepAlive => true;
}
