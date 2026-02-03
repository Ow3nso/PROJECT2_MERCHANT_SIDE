import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Product;
import '../../../widgets/product_card.dart';
import 'section_container.dart';

class OurPicks<T> extends StatelessWidget {
  const OurPicks({
    super.key,
    required this.title,
    this.onTap,
    required this.products,
    required this.future,
    required this.product,
  });
  final String title;
  final void Function()? onTap;
  final Map<String, Product> products;
  final Future<T> future;
  final Product? Function(int, Map<String, Product>) product;

  @override
  Widget build(BuildContext context) {
    return SectionContainer(
      title: title,
      horizontalPadding: 16,
      onTap: onTap,
      hasProducts: products.isNotEmpty,
      childTile: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            FutureBuilder(
                future: future,
                builder: (_, snapshot) {
                  return SizedBox(
                    height: 685,
                    width: MediaQuery.of(context).size.width,
                    child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: .764,
                        crossAxisSpacing: 9,
                        mainAxisSpacing: 8,
                      ),
                      itemBuilder: (context, index) => ProductCard(
                        product: product(index, products)!,
                      ),
                      itemCount: products.keys.length,
                      physics: const NeverScrollableScrollPhysics(),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 4,
                        vertical: 3,
                      ),
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
