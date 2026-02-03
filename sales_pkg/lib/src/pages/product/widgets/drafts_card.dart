import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show NavigationService, Product, ReadContext, StyleColors, WatchContext;
import 'package:sales_pkg/src/controllers/draft_controller.dart';
import 'package:sales_pkg/src/controllers/products_controller.dart';
import 'package:sales_pkg/src/pages/product/pages/add_product_view.dart';
import 'package:sales_pkg/src/pages/product/pages/detail_view.dart';
import 'package:sales_pkg/src/widgets/default_message.dart';
import 'package:sales_pkg/src/utils/styles/app_util.dart';

import '../../../widgets/product_card.dart';

class DraftsCard extends StatelessWidget {
  const DraftsCard({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final routeArgs = ModalRoute.of(context)?.settings.arguments;
    final arguments = routeArgs is Map<String, String?> ? routeArgs : <String, String?>{};
    var productId = arguments['productId'];
    var product = context.watch<ProductController>().draftProducts[productId];
    
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: size.height,
        width: size.width,
        child: FutureBuilder(
          future: context.read<ProductController>().getDraftProducts(),
          builder: (_, snapshot) {
            if (snapshot.hasData) {
              if (context.watch<ProductController>().draftProducts.isEmpty) {
                return Center(
                  child: DefaultMessage(
                    title: 'You don\'t have drafts yet',
                    assetImage: AppUtil.productIcon,
                    color: StyleColors.lukhuError10,
                    description:
                        'Add a product to your store by tapping the button below',
                    label: 'Add Products',
                    onTap: () {
                      NavigationService.navigate(
                          context, AddProductView.routeName);
                    },
                  ),
                );
              }
              return Padding(
                padding: const EdgeInsets.only(top: 16),
                child: RefreshIndicator(
                  onRefresh: () => context
                      .read<ProductController>()
                      .getDraftProducts(isrefreshMode: true),
                  child: GridView.builder(
                    shrinkWrap: true,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1.09,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 9,
                    ),
                    itemCount: context.watch<ProductController>().draftProducts.keys.length,
                    itemBuilder: (context, index) {
                      return ProductCard(
                        type: ProductType.product,
                        product: _product(context, index),
                        onTap: () {
  if (product != null) {
    NavigationService.navigate(
      context, 
      AddProductView.routeName,
      arguments: product.productId,
    );
  }
},
                      );
                    },
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return DefaultMessage(
                title: 'Error',
                assetImage: AppUtil.productIcon,
                color: StyleColors.lukhuError10,
                description: snapshot.error.toString(),
                label: 'Try Again',
                onTap: () {
                  context.read<ProductController>().getDraftProducts();
                },
              );
            }

            return const Center(
              child: CircularProgressIndicator(),
            );
          },
        ),
      ),
    );
  }

  Product? _product(BuildContext context, int index) {
    return context
        .read<ProductController>()
        .draftProducts[_productKey(context, index)];
  }

  String _productKey(BuildContext context, int index) {
    return context.read<ProductController>().draftProducts.keys.elementAt(index);
  }
}
