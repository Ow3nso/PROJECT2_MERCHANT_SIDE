import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show CategoryContainer, NavigationService, Product, ProductListingView, ReadContext, WatchContext;

import '../../../controller/product_controller.dart';

class InfoProducts extends StatelessWidget {
  const InfoProducts({
    super.key,
    required this.product,
  });

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryContainer(
          products: context
                  .read<ProductController>()
                  .sellerProuducts[product.sellerId!] ??
              {},
          future: context.read<ProductController>().getMoreProductsFromSeller(
              limit: 4, sellerId: product.sellerId ?? ''),
          title: 'More from this Seller 🛍',
          isButtonVisible: false,
          onTap: () {
            NavigationService.navigate(context, ProductListingView.routeName,
                arguments: {'title': 'More from this Seller 🛍'});
          },
        ),
        CategoryContainer(
          products: context
                  .watch<ProductController>()
                  .sellerProuductsSimilar[product.category] ??
              {},
          title: 'Similar items 👀',
          isButtonVisible: false,
          onTap: () {
            NavigationService.navigate(context, ProductListingView.routeName,
                arguments: {'title': 'Similar items 👀'});
          },
          future: context.read<ProductController>().getSimilarItems(
              limit: 4,
              category: product.category!,
              productId: product.productId!),
        ),
      ],
    );
  }
}
