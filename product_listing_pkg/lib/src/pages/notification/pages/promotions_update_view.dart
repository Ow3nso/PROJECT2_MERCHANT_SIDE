import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        CardOfferViewType,
        Consumer,
        DefaultBackButton,
        DefaultInputField,
        DefaultTextBtn,
        LuhkuAppBar,
        NavigationService,
        StyleColors;
import 'package:product_listing_pkg/src/controller/notification_controller.dart';
import 'package:product_listing_pkg/src/widgets/offers/card_offer_tile.dart';

import '../../../../utils/app_util.dart';
import '../../../../utils/dialogues.dart';
import '../widgets/filter_card_notifications.dart';
import 'info_view.dart';

enum PromotionUpdateType { updates, promotion }

class PromotionsAndUpdateView extends StatelessWidget {
  const PromotionsAndUpdateView({super.key});
  static const routeName = 'promotion_and_update_view';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<NotificationController>(
        builder: (context, notificationController, _) {
      return Scaffold(
        appBar: LuhkuAppBar(
          appBarType: AppBarType.other,
          title: Text(
            notificationController.screenTitle,
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 24,
              color: StyleColors.lukhuDark1,
            ),
          ),
          backAction:  const DefaultBackButton(),
         bottomHeight: kTextTabBarHeight + kMinInteractiveDimension,
          actions: [
             DefaultTextBtn(
                      onTap: () {
                        if (notificationController.isPromotionPageOpen &&
                            !notificationController.hasUnreadPromotions) {
                          return;
                        } else if (!notificationController.hasUnreadUpdates) {
                          return;
                        }

                        LukhuDialogue.blurredDialogue(
                            context: context,
                            distance: 80,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: FilterCardNotifications(
                                height: 270,
                                onTap: () {
                                  notificationController.markAllAsRead(
                                    notificationController.isPromotionPageOpen
                                        ? 'promo'
                                        : 'updates',
                                  );
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
                      },
                      child: Text(
                        'Mark all as read',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                          color: hasNotificationBeenRead(
                            notificationController,
                          ),
                        ),
                      ),
                    )
          ],
          bottom: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    right: 16, left: 16, top: 16, bottom: 19),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: DefaultInputField(
                        onChange: (p0) {},
                        hintText: 'Search',
                        textInputAction: TextInputAction.done,
                        prefix: Image.asset(
                          AppUtil.iconSearch,
                          height: 20,
                          width: 20,
                          package: AppUtil.packageName,
                          color: StyleColors.lukhuGrey500,
                          fit: BoxFit.scaleDown,
                        ),
                        labelStyle: TextStyle(
                          color: StyleColors.lukhuGrey500,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const SizedBox(width: 18),
                    InkWell(
                      onTap: () {
                        LukhuDialogue.blurredDialogue(
                            context: context,
                            distance: 80,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              child: FilterCardNotifications(
                                height: 350,
                                backgroundColor: StyleColors.lukhuRuby10,
                                notificationType: NotificationType.notification,
                                assetImage: AppUtil.iconNotification,
                                title: 'Filter Your Notification',
                                description:
                                    'Select a status below to filter your orders',
                              ),
                            ));
                      },
                      splashFactory: NoSplash.splashFactory,
                      child: Image.asset(
                        AppUtil.iconFilterEdit,
                        package: AppUtil.packageName,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: SizedBox(
            height: size.height,
            width: size.width,
            child: ListView.builder(
              itemCount: getList(notificationController).length,
              itemBuilder: (context, index) {
                return CardOfferTile(
                  onTap: () {
                    NavigationService.navigate(
                      context,
                      InfoView.routeName,
                      arguments: getList(notificationController)[index],
                    );
                  },
                  type: notificationController.isPromotionPageOpen
                      ? CardOfferViewType.promotion
                      : CardOfferViewType.updates,
                  data: getList(notificationController)[index],
                );
              },
            ),
          ),
        ),
      );
    });
  }

  List<Map<String, dynamic>> getList(
      NotificationController notificationController) {
    return (notificationController.isPromotionPageOpen
        ? notificationController.promotions
        : notificationController.updates);
  }

  Color hasNotificationBeenRead(NotificationController notificationController) {
    return notificationController.isPromotionPageOpen
        ? notificationController.hasUnreadNotifications
            ? StyleColors.lukhuBlue
            : StyleColors.lukhuGrey50
        : notificationController.hasUnreadUpdates
            ? StyleColors.lukhuBlue
            : StyleColors.lukhuGrey50;
  }
}
