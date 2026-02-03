import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultButton, ProductImageHolder, StyleColors;

import '../../utils/product.dart';

class UserItemContainer extends StatelessWidget {
  const UserItemContainer({super.key, this.products = const [], this.onTap});
  final List<Product> products;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 170,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _views.length,
        itemBuilder: (context, index) => _views[index],
      ),
    );
  }

  List<Widget> get _views => [
        const SizedBox(width: 16),
        ...List.generate(
          products.length,
          (i) {
            var product = products[i];
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ProductImageHolder(
                imageUrl: product.image,
                width: 160,
                height: 170,
                fit: BoxFit.cover,
              ),
            );
          },
        ),
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
                  actionDissabledColor: StyleColors.lukhuDisabledButtonColor,
                  label: 'See All',
                  width: 160,
                  height: 170,
                  textColor: StyleColors.lukhuWhite,
                ),
              ),
            ],
          ),
        )
      ];
}
