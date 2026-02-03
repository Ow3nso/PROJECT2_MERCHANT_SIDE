import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        DefaultButton,
        NavigationService,
        ReadContext,
        StyleColors,
        WatchContext;

import '../../../../utils/app_util.dart';
import '../../../controller/product_controller.dart';
import '../../home/widgets/items_loved.dart';
import '../../product/pages/product_listing_view.dart';

class BagMessage extends StatelessWidget {
  const BagMessage({super.key, this.showProducts = true});
  final bool showProducts;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding:
              const EdgeInsets.only(top: 57, left: 16, right: 16, bottom: 24),
          child: Column(
            children: [
              CircleAvatar(
                radius: 29,
                backgroundColor: StyleColors.lukhuError10,
                child: Image.asset(
                  AppUtil.bagCross,
                  package: AppUtil.packageName,
                ),
              ),
              Text(
                'Your bag is empty 😢',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: StyleColors.lukhuDark1,
                    fontSize: 16,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Text(
                'Browse and discover amazing outfits!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.secondary,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 24),
              DefaultButton(
                label: 'Shop Now',
                height: 44,
                onTap: () {
                  Navigator.popUntil(
                    context,
                    (route) => route.isFirst,
                  );
                },
                color: StyleColors.lukhuBlue,
                width: size.width - 32,
              ),
            ],
          ),
        ),
        Divider(
          color: StyleColors.lukhuDividerColor,
        ),
        if (showProducts) ...[
          CategoryContainer(
            future: context.read<ProductController>().getPickedForYou(),
            title: 'Item You Loved',
            onTap: () {
              NavigationService.navigate(context, ProductListingView.routeName,
                  arguments: {'title': 'Item You Loved'});
            },
            products: context.watch<ProductController>().pickedForYou,
          ),
          const SizedBox(
            height: 8,
          ),
          CategoryContainer(
            future: context.read<ProductController>().getPickedForYou(),
            title: 'Recently Viewed Items 👀',
            products: context.watch<ProductController>().pickedForYou,
            onTap: () {
              NavigationService.navigate(context, ProductListingView.routeName,
                  arguments: {'title': 'Recently Viewed Items 👀'});
            },
          ),
        ]
      ],
    );
  }
}
