import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        Consumer,
        DefaultBackButton,
        DefaultTextBtn,
        LuhkuAppBar,
        ReadContext,
        StyleColors,
        WatchContext;
import 'package:product_listing_pkg/src/controller/notification_controller.dart';
import 'package:product_listing_pkg/src/controller/order_controller.dart';
import 'package:product_listing_pkg/src/pages/notification/pages/news_view.dart';
import 'package:product_listing_pkg/src/pages/notification/widgets/filter_card_notifications.dart';
import 'package:product_listing_pkg/utils/dialogues.dart';
import '../../../../utils/app_util.dart';
import '../widgets/notification_order.dart';

class NotificationView extends StatelessWidget {
  const NotificationView({super.key});
  static const routeName = 'notification_view';

  @override
  Widget build(BuildContext context) {
    return Consumer<NotificationController>(
        builder: (context, notificationController, _) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: LuhkuAppBar(
            color: Theme.of(context).colorScheme.onPrimary,
            enableShadow: true,
            appBarType: AppBarType.other,
            bottomHeight: kTextTabBarHeight,
           // height: _isOrderView(notificationController) ? 173 : 144,
            backAction: DefaultBackButton(
              onTap: () {
                notificationController.selectedIndex = 0;
                Navigator.pop(context);
              },
            ),
            title: Text(
                    'Notifications',
                    style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: 24,
                      color: StyleColors.lukhuDark1,
                    ),
                  )
               ,
            actions: [
              if (notificationController.selectedIndex == 1)
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: DefaultTextBtn(
                    onTap: () => _handleMarkReadAction(context),
                    child: Text(
                      'Mark all as read',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                        color: context.watch<OrderController>().hasUnreadOrder
                            ? StyleColors.lukhuBlue
                            : StyleColors.lukhuGrey80,
                      ),
                    ),
                  ),
                )
            ],
            bottom: Column(
              children: [
                TabBar(
                    onTap: (index) {
                      notificationController.selectedIndex = index;
                    },
                    indicatorColor: StyleColors.lukhuDark,
                    labelColor: StyleColors.lukhuDark,
                    labelStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w700),
                    unselectedLabelColor: StyleColors.lukhuDark,
                    unselectedLabelStyle: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.w400),
                    tabs: const [
                      Tab(
                        text: 'News',
                      ),
                      Tab(
                        text: 'Your Orders',
                      ),
                    ]),
              ],
            ),
          ),
          body: const TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                NewsView(),
                NotificationOrder(),
              ]),
        ),
      );
    });
  }


  void _handleMarkReadAction(BuildContext context) {
    if (!context.read<OrderController>().hasUnreadOrder) {
      return;
    }
    LukhuDialogue.blurredDialogue(
        context: context,
        distance: 80,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: FilterCardNotifications(
            height: 270,
            onTap: () {
              context.read<OrderController>().markAllAsRead();
            },
            backgroundColor: StyleColors.lukhuWarning10,
            notificationType: NotificationType.other,
            assetImage: AppUtil.iconAlertTriangle,
            title: 'Hold on!',
            label: 'Yes, I am',
            description:
                'Are you sure you want to mark all your notifications as read?',
          ),
        ));
  }
}
