import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show OrderType, StyleColors, WatchContext;
import 'package:product_listing_pkg/src/controller/order_controller.dart';

import '../../../../utils/app_util.dart';

class OrderIllustration extends StatelessWidget {
  const OrderIllustration(
      {super.key,
      required this.data,
      this.backgroundColor,
      this.index = 0,
      this.type = OrderType.confirmed});
  final Map<String, dynamic> data;
  final Color? backgroundColor;
  final int index;
  final OrderType type;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.max,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 21),
          child: Container(
            height: 40,
            width: 1,
            decoration: BoxDecoration(
              color: StyleColors.lukhuSuccess200,
            ),
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 21,
              backgroundColor: backgroundColor ?? StyleColors.lukhuSuccess200,
              child: Image.asset(
                context.watch<OrderController>().getOrderStatus(type),
                height: 19,
                width: 19,
                package: AppUtil.packageName,
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          data['title'],
                          style: TextStyle(
                            color: StyleColors.gray90,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          data['time'],
                          style: TextStyle(
                            color: StyleColors.lukhuGrey500,
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      data['description'],
                      style: TextStyle(
                        color: StyleColors.lukhuDark1,
                        fontWeight: FontWeight.w400,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
