import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Consumer, NavigationService, StyleColors;
import 'package:product_listing_pkg/src/controller/notification_controller.dart';
import 'package:product_listing_pkg/src/widgets/listing_btn.dart';

class NewsView extends StatelessWidget {
  const NewsView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Consumer<NotificationController>(
        builder: (context, notificationController, _) {
      return Container(
        decoration: BoxDecoration(color: StyleColors.lukhuWhite),
        height: size.height,
        width: size.width,
        child: ListView.builder(
          itemCount: notificationController.notificationNews.length,
          itemBuilder: (context, index) {
            var data = notificationController.notificationNews[index];
            var route = data['route'].toString();
            var label = data['label'].toString();
            return ListingBtn(
              data: data,
              type: ListingBtnType.img,
              onTap: () {
                if (route.isNotEmpty) {
                  notificationController.screenTitle = label;
                  NavigationService.navigate(context, route,
                      arguments: {'title': label});
                }
              },
            );
          },
        ),
      );
    });
  }
}
