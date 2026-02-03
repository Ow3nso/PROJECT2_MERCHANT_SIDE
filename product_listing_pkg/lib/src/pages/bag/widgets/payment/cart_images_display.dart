import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show CartController, ImageCard, ReadContext, StyleColors, WatchContext;

import '../../../../controller/product_controller.dart';

class CartDisplay extends StatelessWidget {
  const CartDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 70,
      decoration: BoxDecoration(
        color: StyleColors.lukhuWhite,
        border: Border.all(
          color: StyleColors.lukhuDividerColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: context.watch<CartController>().cart.keys.length,
                itemBuilder: (context, index) {
                  var product = context
                      .read<ProductController>()
                      .product(index, context.watch<CartController>().cart);
                  return Padding(
                    padding: const EdgeInsets.only(
                      left: 5,
                    ),
                    child: SizedBox(
                      height: 100,
                      width: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: ImageCard(
                          image: product!.images!.first,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          VerticalDivider(
            color: StyleColors.lukhuDividerColor,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${context.watch<CartController>().getBagQuantity()} Item",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: StyleColors.lukhuDark1,
                fontSize: 12,
                fontWeight: FontWeight.w600,
              ),
            ),
          )
        ],
      ),
    );
  }
}
