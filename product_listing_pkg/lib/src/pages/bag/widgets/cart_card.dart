import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show Consumer, Product, QuantityAdjustBtn, StyleColors;
import 'package:product_listing_pkg/src/controller/cart_controller.dart';
import 'package:product_listing_pkg/src/pages/bag/widgets/cart_remove_item_card.dart';
import 'package:product_listing_pkg/utils/dialogues.dart';

import '../../../../utils/app_util.dart';
import '../../../widgets/product_image_holder.dart';

class CartCard extends StatelessWidget {
  const CartCard({super.key, required this.cartProduct});
  final Product cartProduct;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(
      builder: (context, cartController, _) {
        return Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Container(
            padding: const EdgeInsets.only(bottom: 16),
            decoration: BoxDecoration(
              //color: StyleColors.lukhuWhite,
              border: Border(
                bottom: BorderSide(
                  color: StyleColors.lukhuDividerColor,
                ),
              ),
            ),
            child: Row(
              children: [
                ProductImageHolder(
                  radius: 2,
                  height: 100,
                  width: 100,
                  product: cartProduct,
                  fit: BoxFit.cover,
                  show: false,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartProduct.label ?? '',
                        textAlign: TextAlign.start,
                        style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            color: StyleColors.gray90),
                      ),
                      Row(
                        children: [
                          Text(
                            'Size:',
                            style: TextStyle(
                              color: StyleColors.lukhuGrey70,
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            ' ${cartProduct.availableSizes!.first}',
                            style: TextStyle(
                              color: StyleColors.lukhuGrey70,
                              fontSize: 10,
                              fontWeight: FontWeight.w700,
                            ),
                          )
                        ],
                      ),
                      Text(
                        'KSh ${(cartController.getPrice(cartProduct.productId!) * cartController.cartQuantity[cartProduct.productId]!).toStringAsFixed(2)}',
                        style: TextStyle(
                          color: StyleColors.lukhuDark1,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          QuantityAdjustBtn(
                            onAddQuantity: () {
                              cartController.updateCart(
                                value: cartProduct,
                                addProduct: true,
                              );
                            },
                            onMinusQuantity: () {
                              cartController.updateCart(
                                value: cartProduct,
                              );
                            },
                            quantity: cartController
                                .getCartQuantity(cartProduct.productId!),
                          ),
                          IconButton(
                            icon: Image.asset(
                              AppUtil.iconTrash,
                              package: AppUtil.packageName,
                            ),
                            onPressed: () {
                              LukhuDialogue.blurredDialogue(
                                context: context,
                                distance: 72,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16),
                                  child: CartRemoveItemCard(
                                    onTap: () {
                                      cartController.addToCart(cartProduct);
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
