import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AuthGenesisPage,
        Consumer,
        DefaultButton,
        NavigationService,
        ReadContext,
        StyleColors,
        UserRepository;
import 'package:product_listing_pkg/src/controller/cart_controller.dart';
import 'package:product_listing_pkg/src/controller/offer_controller.dart';
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import 'package:product_listing_pkg/utils/dialogues.dart';

import 'make_offer_container.dart';

class OfferCard extends StatelessWidget {
  const OfferCard({super.key, required this.id});
  final String id;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
        builder: (context, productController, _) {
      var product = productController.products[id];
      return Consumer<CartController>(builder: (context, cartController, _) {
        return Container(
          height: 80,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 19),
          decoration: BoxDecoration(
            color: StyleColors.lukhuWhite,
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (productController.hasAmountDiscount)
                      Text(
                        'KSh ${productController.getProductAmount(id)}',
                        style: TextStyle(
                          color: StyleColors.lukhuError,
                          fontWeight: FontWeight.w800,
                          fontSize: 16,
                        ),
                      ),
                    Text(
                      'KSh ${productController.getProductAmount(id, true)}',
                      style: productController.hasAmountDiscount
                          ? TextStyle(
                              color: StyleColors.lukhuGrey80,
                              fontWeight: FontWeight.w500,
                              fontSize: 10,
                              decoration: TextDecoration.lineThrough,
                            )
                          : TextStyle(
                              color: StyleColors.lukhuGrey80,
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 20),
              Expanded(
                flex: 4,
                child: DefaultButton(
                  boarderColor: StyleColors.lukhuDividerColor,
                  label: 'Make Offer',
                  textColor: StyleColors.gray90,
                  height: 40,
                  onTap: () {
                    if (!context.read<UserRepository>().userAuthenticated) {
                      NavigationService.navigate(
                        context,
                        AuthGenesisPage.routeName,
                        forever: true,
                      );
                      return;
                    }
                    context.read<OfferController>().product = product;
                    context.read<OfferController>().init();
                    LukhuDialogue.blurredDialogue(
                        child: MakeOfferContainer(id: id), context: context);
                  },
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                flex: 4,
                child: DefaultButton(
                  boarderColor: StyleColors.lukhuDividerColor,
                  label: cartController.isAddedToCart(
                          productController.selectedProduct?.productId ?? '')
                      ? 'Added To Bag'
                      : 'Buy Now',
                  textColor: StyleColors.lukhuWhite,
                  color: cartController.isAddedToCart(
                          productController.selectedProduct?.productId ?? '')
                      ? StyleColors.lukhuDisabledButtonColor
                      : StyleColors.lukhuBlue,
                  height: 40,
                  width: 128,
                  onTap: () {
                    cartController
                        .addToCart(productController.selectedProduct!);
                  },
                ),
              ),
            ],
          ),
        );
      });
    });
  }
}
