import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AuthGenesisPage,
        DefaultButton,
        NavigationService,
        ReadContext,
        ShortMessages,
        StyleColors,
        WatchContext;
import 'package:product_listing_pkg/src/controller/shop_controller.dart';

class FollowButton extends StatelessWidget {
  const FollowButton(
      {
    super.key,
    required this.shopId,
    this.width = 84,
    required this.userId,
  });
  final String shopId;
  final double width;
  final String? userId;

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<ShopController>();
    return DefaultButton(
      label: controller.hasFollowedShop(shopId: shopId, userId: userId)
          ? 'Following'
          : 'Follow',
      height: 33,
      width: width,
      color: StyleColors.lukhuBlue,
      onTap: () {
        follow(context);
      },
    );
  }

  void follow(BuildContext context) {
    if (userId == null) {
      NavigationService.navigate(
        context,
        AuthGenesisPage.routeName,
        forever: true,
      );
      return;
    }
    if (context.read<ShopController>().userOwnsShop(shopId, userId!)) {
      ShortMessages.showShortMessage(
        message: 'User cannot follow their own shop',
      );

      return;
    }
    context.read<ShopController>().followShop(shopId: shopId, userId: userId);
  }
}
