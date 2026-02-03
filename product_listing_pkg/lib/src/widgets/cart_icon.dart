import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show NavigationService, StyleColors, UserType, WatchContext;
import 'package:product_listing_pkg/src/controller/cart_controller.dart';
import 'package:product_listing_pkg/src/pages/bag/pages/bag_view.dart';
import 'package:product_listing_pkg/utils/app_util.dart';

import '../pages/bag/pages/checkouk_view.dart';

class CartIcon extends StatelessWidget {
  const CartIcon({super.key, this.userType = UserType.buyer, this.color});
  final UserType userType;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Align(
      child: Stack(
        children: [
          IconButton(
              onPressed: () {
                NavigationService.navigate(
                    context,
                    userType == UserType.buyer
                        ? BagView.routeName
                        : CheckoutView.routeName,
                    arguments: {'type': userType});
              },
              icon: Image.asset(
                AppUtil.bagImage2,
                package: AppUtil.packageName,
                color: color,
              )),
          if (context.watch<CartController>().cartCount > 0)
            AnimatedPositioned(
                duration: const Duration(milliseconds: 500),
                bottom: 2,
                right: 5.5,
                child: CircleAvatar(
                  radius: 8,
                  backgroundColor: StyleColors.lukhuWhite,
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: CircleAvatar(
                      backgroundColor: StyleColors.pink,
                      child: Center(
                        child: Text(
                          '${context.watch<CartController>().cartCount}',
                          style: TextStyle(
                              color: StyleColors.lukhuWhite,
                              fontSize: 10,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                ))
        ],
      ),
    );
  }
}
