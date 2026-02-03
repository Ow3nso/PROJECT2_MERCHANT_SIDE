import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show Consumer, ReadContext, StyleColors;
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import '../../../../controller/cart_controller.dart';
import '../../../../widgets/product_image_holder.dart';

enum DeliveryCardType { delivery, review }

class DeliveryTileCard extends StatelessWidget {
  const DeliveryTileCard(
      {super.key,
      this.onTap,
      this.child,
      this.height,
      this.iconSize,
      this.type = DeliveryCardType.delivery,
      this.padding,
      this.color});
  final void Function()? onTap;
  final Widget? child;
  final double? height;
  final double? iconSize;
  final EdgeInsets? padding;
  final DeliveryCardType type;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Consumer<CartController>(builder: (context, cartController, _) {
      return Container(
        height: height,
        decoration: BoxDecoration(
          color: color ?? StyleColors.lukhuWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: StyleColors.lukhuDividerColor,
          ),
        ),
        child: InkWell(
          onTap: onTap,
          splashColor: StyleColors.lukhuWhite,
          child: Padding(
            padding: padding ?? const EdgeInsets.all(11.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                child ??
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:
                          List.generate(cartController.cart.length, (index) {
                        var product = context
                            .read<ProductController>()
                            .product(index, cartController.cart);
                        return Padding(
                          padding: const EdgeInsets.only(right: 6),
                          child: ProductImageHolder(
                            product: product,
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                            show: false,
                          ),
                        );
                      }),
                    ),
                if (type == DeliveryCardType.delivery)
                  Icon(
                    Icons.arrow_forward_ios,
                    color: StyleColors.lukhuGrey70,
                    size: iconSize ?? 24,
                  )
              ],
            ),
          ),
        ),
      );
    });
  }
}
