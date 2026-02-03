import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show DefaultInputField, StyleColors;
import 'package:product_listing_pkg/src/pages/notification/widgets/filter_card_notifications.dart';

import 'package:product_listing_pkg/utils/app_util.dart';
import 'package:product_listing_pkg/utils/dialogues.dart';

import 'orders_container.dart';

class NotificationOrder extends StatelessWidget {
  const NotificationOrder({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      padding: const EdgeInsets.only(right: 16, left: 16, top: 25),
      decoration: BoxDecoration(color: StyleColors.lukhuWhite),
      child: Column(
        children: [
          Row(
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
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: FilterCardNotifications(
                          notificationType: NotificationType.orders,
                          assetImage: AppUtil.iconBoxSearch,
                          title: 'Filter Your Orders',
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
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _views.length,
              itemBuilder: (context, index) => _views[index],
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> get _views => const [
        OrdersContainer(
          title: 'Unread',
          isRead: false,
        ),
        OrdersContainer(
          title: 'Read',
          isRead: true,
        ),
      ];
}
