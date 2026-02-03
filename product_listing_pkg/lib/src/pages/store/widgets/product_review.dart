import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show ReadContext, Review;
import 'package:product_listing_pkg/src/controller/review_controller.dart';

import '../../../widgets/content_loader.dart';
import '../../../widgets/review_card.dart';

class ProductReview<T> extends StatelessWidget {
  const ProductReview({super.key, this.future, required this.reviews});
  final Future<T>? future;
  final Map<String, Review> reviews;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return FutureBuilder(
        future: future,
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            if (reviews.isEmpty) {
              return Center(
                child: Text(
                  'Product reviews not available at the moment.',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.scrim,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              );
            }
            return RefreshIndicator(
              onRefresh: () {
                return getReviews(context);
              },
              child: SizedBox(
                width: size.width,
                height: size.height,
                child: ListView.builder(
                  itemCount: reviews.keys.length,
                  itemBuilder: (context, index) => ReviewCard(
                    review: context
                        .read<ReviewController>()
                        .reviewData(index, reviews)!,
                  ),
                ),
              ),
            );
          }
          return const ContentLoader();
        });
  }

  Future<void> getReviews(BuildContext context) async {
    context.read<ReviewController>().getProductReview(productId: '', isrefreshMode: true);
  }
}
