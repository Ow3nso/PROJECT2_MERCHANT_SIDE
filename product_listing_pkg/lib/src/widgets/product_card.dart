import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show Consumer, Product, ReadContext, StyleColors;
import 'package:product_listing_pkg/src/controller/cart_controller.dart';
import 'package:product_listing_pkg/utils/app_util.dart';
import '../controller/product_controller.dart';
import '../pages/product/widgets/like_button.dart';
import 'product_image_holder.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    super.key,
    required this.product,
    this.isProductInDiscovery = false,
  });
  final Product product;
  final bool isProductInDiscovery;

  @override
  Widget build(BuildContext context) {
    var productController = context.read<ProductController>();
    var updatedProduct =
        productController.products[product.productId] ?? product;
    return Consumer<CartController>(builder: (context, cartState, _) {
      return Material(
        color: StyleColors.lukhuWhite,
        borderRadius: BorderRadius.circular(4),
        child: Column(
          children: [
            Expanded(
              child: ProductImageHolder(
                product: product,
                isProductInDiscovery: isProductInDiscovery,
                width: MediaQuery.of(context).size.width,
                height: 180,
                fit: BoxFit.cover,
                showBag: true,
                onTap: () {
                  cartState.addToCart(product);
                },
              ),
            ),
            SizedBox(height: isProductInDiscovery ? 10 : 8),
            Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: isProductInDiscovery ? 0 : 8),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isProductInDiscovery)
                          Text(
                            product.availableSizes!.first,
                            style: TextStyle(
                              color: StyleColors.lukhuDark1,
                            ),
                          ),
                        Row(
                          children: [
                            if (isProductInDiscovery)
                              Row(
                                children: [
                                  CircleAvatar(
                                      radius: 12,
                                      backgroundColor:
                                          StyleColors.lukhuProfile),
                                  const SizedBox(width: 5),
                                  Text(
                                    product.label ?? '',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 10,
                                      color: StyleColors.lukhuDark1,
                                    ),
                                  ),
                                  const SizedBox(width: 3),
                                  if (product.isVerified ?? false)
                                    Image.asset(
                                      AppUtil.iconVerified,
                                      package: AppUtil.packageName,
                                      width: 12,
                                      height: 12,
                                    )
                                ],
                              ),
                          ],
                        )
                      ],
                    ),
                    const Spacer(),
                    Expanded(
                      // flex: widget.isProductInDiscovery ? 2 : 1,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: isProductInDiscovery ? 0 : 4),
                              child: LikeButton(
                                productId: product.productId!,
                                isLiked: productController.hasUserLiked(
                                    product.productId!,
                                    productController.userId),
                              ),
                            ),
                          ),
                          if (isProductInDiscovery)
                            Expanded(
                              flex: 4,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 8, right: 1),
                                child: Text(
                                  '${updatedProduct.likes!.length}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 10,
                                    color: StyleColors.lukhuDark1,
                                  ),
                                ),
                              ),
                            )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 9),
          ],
        ),
      );
    });
  }
}
