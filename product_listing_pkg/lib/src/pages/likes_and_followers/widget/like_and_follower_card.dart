import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show Consumer, DefaultButton, StyleColors, CardOfferViewType;
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import 'package:product_listing_pkg/src/widgets/product_image_holder.dart';

class LikedAndFollowerCard extends StatelessWidget {
  const LikedAndFollowerCard({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
        builder: (context, productController, _) {
      return Padding(
        padding:
            const EdgeInsets.only(right: 16, left: 16, top: 16, bottom: 16),
        child: Row(
          children: [
            CircleAvatar(
              backgroundColor: StyleColors.pink,
              radius: 14,
              child: InkWell(
                onTap: () {},
                child: CircleAvatar(
                  backgroundImage: NetworkImage(data['avatar']),
                  backgroundColor: StyleColors.pink,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
              child: Row(children: [
                Text(
                  data['name'],
                  style: TextStyle(
                      color: StyleColors.gray90,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(width: 5),
                Text(
                  data['message'],
                  style: TextStyle(
                      color: StyleColors.gray90,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(width: 5),
                Text(
                  data['time'],
                  style: TextStyle(
                      color: StyleColors.gray90,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                if (data['product_id'] != '')
                  ProductImageHolder(
                    height: 42,
                    width: 42,
                    radius: 4,
                    fit: BoxFit.cover,
                    type: CardOfferViewType.offer,
                    isProductInDiscovery: true,
                    allowNavigation: true,
                    product: productController.selectedProduct,
                  ),
                if (data['isFollowing'] != null && !data['isFollowing'])
                  DefaultButton(
                    height: 28,
                    width: 68,
                    onTap: () {},
                    label: 'Follow',
                    color: StyleColors.lukhuBlue,
                  )
              ]),
            )
          ],
        ),
      );
    });
  }
}
