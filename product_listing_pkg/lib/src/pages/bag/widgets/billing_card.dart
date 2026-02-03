import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultButton, StyleColors, WatchContext;
import 'package:product_listing_pkg/src/controller/cart_controller.dart';
import 'package:product_listing_pkg/src/controller/checkout_controller.dart';

import '../../../widgets/offers/offer_text_tile.dart';

enum BillingCartType { bag, checkout, addNewSale }

class BillingCard extends StatelessWidget {
  const BillingCard(
      {super.key,
      this.onTap,
      required this.label,
      this.index = 0,
      this.type = BillingCartType.bag});
  final void Function()? onTap;
  final String label;
  final BillingCartType type;
  final int index;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: type.name.contains('bag')
          ? 219
          : index == 1
              ? 290
              : 220,
      decoration: BoxDecoration(
        color: StyleColors.lukhuWhite,
      ),
      child: Column(
        children: [
          if (type == BillingCartType.checkout &&
              index == 1)
            Container(
              decoration: BoxDecoration(
                  color: StyleColors.lukhuGrey10,
                  border: Border(
                      top: BorderSide(color: StyleColors.lukhuDividerColor))),
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 10, bottom: 10),
              child: Column(
                children: [
                  OfferTextTile(
                    title: 'Sub Total',
                    description: '${context.watch<CartController>().cartTotal}',
                    alignment: MainAxisAlignment.spaceBetween,
                    titleStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: StyleColors.lukhuGrey70,
                        fontSize: 12),
                    descriptionStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: StyleColors.lukhuGrey70,
                        fontSize: 12),
                  ),
                  const SizedBox(
                    height: 11,
                  ),
                  OfferTextTile(
                    title: 'Delivery Fee',
                    description: '0',
                    alignment: MainAxisAlignment.spaceBetween,
                    titleStyle: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: StyleColors.lukhuGrey70,
                        fontSize: 12),
                    descriptionStyle: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: StyleColors.lukhuGrey70,
                        fontSize: 12),
                  ),
                  if (context.watch<CheckoutController>().hasDiscount)
                    const SizedBox(
                      height: 11,
                    ),
                  if (context.watch<CheckoutController>().hasDiscount)
                    OfferTextTile(
                      title: 'Discount',
                      description: '- KSh 70',
                      alignment: MainAxisAlignment.spaceBetween,
                      titleStyle: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: StyleColors.lukhuGrey70,
                          fontSize: 12),
                      descriptionStyle: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: StyleColors.lukhuSuccess200,
                          fontSize: 12),
                    ),
                ],
              ),
            ),
          Container(
            decoration: BoxDecoration(
                color: StyleColors.lukhuGrey10,
                border: Border(
                    top: BorderSide(color: StyleColors.lukhuDividerColor))),
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 14, top: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    color: StyleColors.lukhuDark1,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
                Text(
                  'KSh ${context.watch<CartController>().cartTotal.toStringAsFixed(2)}',
                  style: TextStyle(
                    color: StyleColors.lukhuDark1,
                    fontWeight: FontWeight.w800,
                    fontSize: 18,
                  ),
                )
              ],
            ),
          ),
          Container(
            width: size.width,
            padding:
                const EdgeInsets.only(top: 27, bottom: 80, right: 16, left: 16),
            decoration: BoxDecoration(
                border: Border(
                    top: BorderSide(color: StyleColors.lukhuDividerColor))),
            child: DefaultButton(
              width: size.width - 32,
              height: 40,
              actionDissabledColor: StyleColors.lukhuDisabledButtonColor,
              color: context.watch<CartController>().cart.isNotEmpty
                  ? StyleColors.lukhuBlue
                  : null,
              label: label,
              onTap: onTap,
            ),
          )
        ],
      ),
    );
  }
}
