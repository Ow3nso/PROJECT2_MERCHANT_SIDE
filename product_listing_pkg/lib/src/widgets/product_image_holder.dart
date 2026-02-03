import 'package:flutter/material.dart';
import 'package:product_listing_pkg/src/controller/cart_controller.dart';
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import 'package:product_listing_pkg/utils/app_util.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        CardOfferViewType,
        Consumer,
        DiscountCard,
        ImageCard,
        NavigationService,
        Product,
        ProductFields,
        StyleColors,
        WatchContext;
import '../pages/product/pages/product_info_view.dart';
import 'add_to_bag.dart';

class ProductImageHolder extends StatelessWidget {
  const ProductImageHolder(
      {super.key,
      this.height,
      this.width,
      this.product,
      this.type = CardOfferViewType.offer,
      this.fit,
      this.showBag = false,
      this.isProductInDiscovery = false,
      this.onTap,
      this.show = true,
      this.allowNavigation = true,
      this.imageUrl,
      this.isReadNotification = false,
      this.productId,
      this.radius = 4});
  final double? height;
  final double? width;
  final Product? product;
  final BoxFit? fit;
  final bool showBag;
  final bool isProductInDiscovery;
  final void Function()? onTap;
  final bool show;
  final double radius;
  final bool allowNavigation;
  final CardOfferViewType type;
  final String? imageUrl;
  final bool isReadNotification;
  final String? productId;

  @override
  Widget build(BuildContext context) {
    return Consumer<ProductController>(
        builder: (context, productController, _) {
      return Stack(
        children: [
          SizedBox(
            height: height,
            width: width,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(radius),
              child: InkWell(
                onTap: () {
                  productController.selectedColor = null;
                  productController.selectedSize = 'Selecct Size';
                  if (allowNavigation) {
                    if (product != null || productId != null) {
                      productController.updateProductDiscount(
                          productId ?? product!.productId!);
                    }
                    NavigationService.navigate(
                        context, ProductInfoView.routeName,
                        arguments: {
                          ProductFields.productId:
                              productId ?? product!.productId,
                        });
                  }
                },
                child: ImageCard(
                  image: imageUrl ?? product?.images?.first ?? '',
                  fit: fit,
                ),
              ),
            ),
          ),
          if (type == CardOfferViewType.order && !isReadNotification)
            Positioned(
              top: 0,
              left: 1,
              child: CircleAvatar(
                backgroundColor: StyleColors.lukhuRed,
                radius: 4,
              ),
            ),
          if (showBag &&
              !(product?.isSoldOut ?? false) &&
              !isProductInDiscovery &&
              show)
            Positioned(
              bottom: 5,
              right: 5,
              child:
                  AddToBagBtn(activeCart: _addedToCart(context), onTap: onTap),
            ),
          if (isProductInDiscovery && (product?.isOnSale ?? false) && show)
            Positioned(
              bottom: 5,
              right: 5,
              child: CircleAvatar(
                backgroundColor: StyleColors.lukhuWhite,
                child: InkWell(
                  onTap: null,
                  child: Image.asset(
                    AppUtil.shoppingBag,
                    package: AppUtil.packageName,
                  ),
                ),
              ),
            ),
          if ((product?.isOnDiscount ?? false) && !isProductInDiscovery && show)
            Positioned(
              top: 5,
              left: 5,
              child: DiscountCard(
                packageName: AppUtil.packageName,
                iconImage: AppUtil.iconOfferImage,
                color: StyleColors.lukhuWhite,
                description: productController.getDiscoountText(product!),
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: StyleColors.lukhuError,
                  fontSize: 10,
                ),
              ),
            ),
          if ((product?.isVerified ?? false) && !isProductInDiscovery && show)
            Positioned(
              top: 5,
              right: 5,
              child: CircleAvatar(
                backgroundColor: StyleColors.lukhuWhite,
                radius: 10,
                child: Image.asset(
                  AppUtil.iconVerified,
                  package: AppUtil.packageName,
                  height: 14,
                  width: 14,
                ),
              ),
            ),
          if ((product?.isOnTopRated ?? false) && !isProductInDiscovery && show)
            Positioned(
              bottom: 5,
              left: 5,
              child: DiscountCard(
                packageName: AppUtil.packageName,
                iconImage: AppUtil.iconOfferHourlyImage,
                color: StyleColors.lukhuError,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: StyleColors.lukhuWhite,
                  fontSize: 10,
                ),
                description: productController.getDiscoountText(product!),
              ),
            ),
          if ((product?.isSoldOut ?? false) && !isProductInDiscovery && show)
            Positioned(
              child: Container(
                height: height,
                alignment: Alignment.center,
                width: width,
                decoration: BoxDecoration(
                  color: StyleColors.lukhuDark.withOpacity(.5),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  'SOLD',
                  style: TextStyle(
                    color: StyleColors.lukhuWhite,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            )
        ],
      );
    });
  }

  bool _addedToCart(BuildContext context) =>
      context.watch<CartController>().isAddedToCart(product?.productId ?? '');
}
