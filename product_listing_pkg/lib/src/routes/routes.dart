import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show ChangeNotifierProvider, SingleChildWidget, Provider;
import 'package:product_listing_pkg/product_listing_pkg.dart';
import 'package:product_listing_pkg/src/controller/filter_sort_controller.dart';
import 'package:product_listing_pkg/src/controller/notification_controller.dart';
import 'package:product_listing_pkg/src/controller/order_controller.dart';
import 'package:product_listing_pkg/src/controller/post_outfit_controller.dart';
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import 'package:product_listing_pkg/src/controller/search_controller.dart';
import 'package:product_listing_pkg/src/pages/bag/pages/payment_view.dart';
import 'package:product_listing_pkg/src/pages/notification/pages/info_view.dart';
import 'package:product_listing_pkg/src/pages/notification/pages/notification_view.dart';
import 'package:product_listing_pkg/src/pages/bag/pages/bag_view.dart';
import 'package:product_listing_pkg/src/pages/likes_and_followers/likes_and_followers_view.dart';

import 'package:product_listing_pkg/src/pages/product/pages/post_out_fit_view.dart';
import 'package:product_listing_pkg/src/pages/notification/pages/promotions_update_view.dart';

import 'package:product_listing_pkg/src/pages/search/search.dart';
// import 'package:product_listing_pkg/src/pages/seller/seller.dart';
import '../controller/checkout_controller.dart';
import '../controller/offer_controller.dart';
import '../controller/review_controller.dart';
import '../controller/shop_controller.dart';
// import '../pages/bag/pages/checkouk_view.dart';
import '../pages/product/pages/offer_view.dart';
import '../pages/product/pages/review_product_view.dart';
import '../pages/search/screens/item_view.dart';
import '../pages/store/pages/boosted_store_view.dart';
import '../pages/store/pages/store_view.dart';

//import 'packages:product_listing_pkg/src/controller/post_outfit_controller.dart';

class ListingRoutes {
  static Map<String, Widget Function(BuildContext)> guarded = {
    // SellPage.routeName: (p0) => const SellPage(),
    // CheckoutView.routeName: (p0) => const CheckoutView(),
    PaymentView.routeName: (p0) => const PaymentView(),
    NotificationView.routeName: (p0) => const NotificationView(),
    PaymentOrderView.routeName: (p0) => const PaymentOrderView(),
  };

  static Map<String, Widget Function(BuildContext)> public = {
    // SellPage.routeName: (p0) => const SellPage(),
    HomePage.routeName: (p0) => const HomePage(),
    SearchPage.routeName: (p0) => const SearchPage(),
    ProductListingView.routeName: (p0) => const ProductListingView(),
    PostOutfitView.routeName: (p0) => const PostOutfitView(),
    BoostedStoreView.routeName: (p0) => const BoostedStoreView(),
    BagView.routeName: (p0) => const BagView(),
    ProductInfoView.routeName: (p0) => const ProductInfoView(),
    SizeGuidView.routeName: (p0) => const SizeGuidView(),
    OfferView.routeName: (p0) => const OfferView(),
    ReviewProductView.routeName: (p0) => const ReviewProductView(),
    StoreView.routeName: (p0) => const StoreView(),
    PromotionsAndUpdateView.routeName: (p0) => const PromotionsAndUpdateView(),
    LikesAndFollowersView.routeName: (p0) => const LikesAndFollowersView(),
    InfoView.routeName: (p0) => const InfoView(),
    OrderView.routeName: (p0) => const OrderView(),
    SearchItemPage.routeName: (p0) => const SearchItemPage(),
  };

  static List<SingleChildWidget> listingProviders() {
    return [
      ChangeNotifierProvider(
        create: (_) => CartController(),
      ),
      ChangeNotifierProvider(
        create: (_) => NotificationController(),
      ),
      ChangeNotifierProvider(
        create: (_) => PostOutfitController(),
      ),
      ChangeNotifierProvider(
        create: (_) => FilterSortController(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProductController(),
      ),
      ChangeNotifierProvider(
        create: (_) => OrderController(),
      ),
      ChangeNotifierProvider(
        create: (_) => CheckoutController(),
      ),
      ChangeNotifierProvider(
        create: (_) => ProductSearchController(),
      ),
      ChangeNotifierProvider(
        create: (_) => ShopController(),
      ),
      ChangeNotifierProvider(
        create: (_) => ReviewController(),
      ),
      ChangeNotifierProvider(create: (_) => OfferController()),
      ChangeNotifierProvider(
        create: (_) => LocationController(),
      ),
       Provider<BuildContext>(create: (c) => c),
    ];
  }
}
