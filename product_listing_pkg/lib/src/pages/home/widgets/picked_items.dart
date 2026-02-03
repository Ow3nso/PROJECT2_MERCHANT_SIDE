import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultButton, Product, StyleColors, WatchContext;
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import 'package:product_listing_pkg/src/widgets/content_loader.dart';
import '../../../widgets/product_image_holder.dart';
import 'section_container.dart';

class PickedItems<T> extends StatelessWidget {
  const PickedItems({
    super.key,
    required this.title,
    this.onTap,
    required this.product,
    required this.future,
  });
  final String title;
  final void Function()? onTap;
  final Map<String, Product> product;
  final Future<T> future;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: title,
      horizontalPadding: 0,
      hasProducts: product.isNotEmpty,
      onTap: onTap,
      childTile: Column(
        children: [
          FutureBuilder(
              future: future,
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  if (product.isEmpty) {
                    return const ContentLoader();
                  }
                  return SizedBox(
                    height: 350,
                    width: MediaQuery.of(context).size.width,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        const SizedBox(width: 16),
                        GridView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1.08,
                            crossAxisSpacing: 5,
                            mainAxisSpacing: 8,
                          ),
                          itemCount: product.keys.length,
                          itemBuilder: (context, index) => ProductImageHolder(
                            width: 160,
                            height: 170,
                            product: context
                                .watch<ProductController>()
                                .product(index, product),
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            right: 8,
                            left: 8,
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: DefaultButton(
                                  onTap: onTap,
                                  color: StyleColors.lukhuBlue,
                                  actionDissabledColor:
                                      StyleColors.lukhuDisabledButtonColor,
                                  label: 'See All',
                                  width: 160,
                                  style: TextStyle(
                                      color: StyleColors.lukhuWhite,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
                return Container();
              }),
          const SizedBox(height: 12)
        ],
      ),
    );
  }
}
