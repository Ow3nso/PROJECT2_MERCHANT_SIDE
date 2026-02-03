import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AppBarType, Consumer, DefaultBackButton, DefaultMessage, LuhkuAppBar, StyleColors;
import 'package:product_listing_pkg/src/controller/notification_controller.dart';
import 'package:product_listing_pkg/src/pages/likes_and_followers/widget/like_and_follower_card.dart';

class LikesAndFollowersView extends StatelessWidget {
  const LikesAndFollowersView({super.key});
  static const routeName = 'likes_and_followers';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        enableShadow: true,
        color: Theme.of(context).colorScheme.onPrimary,
        backAction: const DefaultBackButton(),
        title: Text(
          'Likes and new followers',
          style: TextStyle(
            fontWeight: FontWeight.w800,
            fontSize: 24,
            color: StyleColors.lukhuDark1,
          ),
        ),
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Consumer<NotificationController>(
          builder: (context, notificationController, child) {
            return DefaultMessage(
        
        
        title: "You don't have new likes or followers",
        description: 'Refresh by tapping the button below.',
        label: 'Refresh',
        onTap: () {},
      );
          },
        ),
      ),
    );
  }
}
