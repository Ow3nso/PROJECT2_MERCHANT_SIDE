import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        Consumer,
        DefaultBackButton,
        LuhkuAppBar,
        StyleColors,
        WatchContext,
        ReadContext;
import 'package:product_listing_pkg/src/controller/review_controller.dart';

import '../../../controller/product_controller.dart';
import '../../store/widgets/product_review.dart';

class ReviewProductView extends StatelessWidget {
  const ReviewProductView({super.key});
  static const routeName = 'review_product_view';

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
        builder: (context, productController, _) {
      return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: LuhkuAppBar(
            appBarType: AppBarType.other,
            color: Theme.of(context).colorScheme.onPrimary,
            enableShadow: true,
            backAction: const DefaultBackButton(),
            title: Text(
                      'Reviews',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 24,
                        color: StyleColors.lukhuDark1,
              ),
            ),
            height: 133,
            bottom: TabBar(
                indicatorColor: StyleColors.lukhuDark,
                indicatorWeight: 4,
                labelColor: StyleColors.lukhuDark,
                labelStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                unselectedLabelColor: StyleColors.lukhuDark,
                unselectedLabelStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                tabs: const [
                  Tab(
                    text: 'Sold Items',
                  ),
                  Tab(
                    text: 'Bought Items',
                  ),
                ]),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 0),
            child: TabBarView(
                children: [
              ProductReview(
                reviews: context.watch<ReviewController>().reviews,
                future: context
                    .read<ReviewController>()
                    .getProductReview(productId: ''),
              ),
              ProductReview(
                reviews: context.watch<ReviewController>().reviews,
                future: context
                    .read<ReviewController>()
                    .getProductReview(productId: ''),
              ),
            ]),
          ),
        ),
      );
    });
  }

}
