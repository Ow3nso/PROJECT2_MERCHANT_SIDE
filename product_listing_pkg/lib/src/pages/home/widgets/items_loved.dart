import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show CategoryType, DefaultButton, Product, ReadContext, StyleColors;
import 'package:product_listing_pkg/src/controller/product_controller.dart';
import '../../../widgets/content_loader.dart';
import '../../../widgets/product_image_holder.dart';
import 'section_container.dart';

class CategoryContainer<T> extends StatelessWidget {
  const CategoryContainer({
    super.key,
    required this.products,
    this.onTap,
    required this.title,
    this.isButtonVisible = true,
    this.future,
    this.type = CategoryType.product,
  });
  final String title;
  final Map<String, Product> products;
  final void Function()? onTap;
  final bool isButtonVisible;
  final Future<T>? future;
  final CategoryType type;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: title,
      horizontalPadding: 0,
      type: type,
      isButtonVisible: isButtonVisible,
      onTap: onTap,
      hasProducts: products.isNotEmpty,
      childTile: Column(
        children: [
          FutureBuilder(
              future: future,
              builder: (_, snapshot) {
                if (snapshot.hasData) {
                  if (products.isEmpty) {
                    return const ContentLoader();
                  }
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: 170,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        const SizedBox(width: 16),
                        ...List.generate(
                          products.keys.length,
                          (i) => Padding(
                            padding: const EdgeInsets.only(right: 8),
                            child: ProductImageHolder(
                              product: context
                                  .read<ProductController>()
                                  .product(i, products),
                              width: 160,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        if (products.keys.length > 6)
                          Padding(
                          padding: const EdgeInsets.only(
                            right: 8,
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
                                  textColor: StyleColors.lukhuWhite,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }
                return const ContentLoader();
              }),
          const SizedBox(
            height: 12,
          ),
        ],
      ),
    );
  }
}
