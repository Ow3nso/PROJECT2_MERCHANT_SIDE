import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DateFormat, Review, StyleColors;
import 'package:product_listing_pkg/src/widgets/product_image_holder.dart';
import 'package:product_listing_pkg/utils/dialogues.dart';

import 'review_card_pop.dart';

class ReviewCard extends StatelessWidget {
  const ReviewCard({super.key, required this.review});

  final Review review;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: StyleColors.lukhuWhite,
          border:
              Border(bottom: BorderSide(color: StyleColors.lukhuDividerColor)),
        ),
        child: InkWell(
          onTap: () {
            LukhuDialogue.blurredDialogue(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: ReviewCardPop(
                    store: review,
                  ),
                ),
                context: context,
                distance: 80);
          },
          child: Row(
            children: [
              ProductImageHolder(
                imageUrl: review.imageUrl,
                height: 74,
                width: 70,
                isProductInDiscovery: true,
                fit: BoxFit.cover,
              ),
              const SizedBox(
                width: 8,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: StyleColors.pink,
                          radius: 10,
                          backgroundImage: review.imageUrl != null
                              ? NetworkImage(review.imageUrl ?? '')
                              : null,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          review.name!,
                          style: TextStyle(
                              color: StyleColors.lukhuDark1,
                              fontSize: 12,
                              fontWeight: FontWeight.w600),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Row(
                          children: List.generate(
                              5,
                              (index) => Icon(Icons.star,
                                  size: 10,
                                  color: index == 4
                                      ? StyleColors.lukhuDividerColor
                                      : StyleColors.rateColor)),
                        )
                      ],
                    ),
                    Text(review.description!,
                        style: TextStyle(
                            color: StyleColors.lukhuDark1,
                            fontSize: 12,
                            fontWeight: FontWeight.w400)),
                    const SizedBox(
                      height: 22,
                    ),
                    Text(DateFormat('yyyy-MM-dd').format(review.createdAt!),
                        style: TextStyle(
                            color: StyleColors.lukhuPriceColor,
                            fontSize: 12,
                            fontWeight: FontWeight.w500)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
