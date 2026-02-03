import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show CategoryType, StyleColors;

class SectionContainer extends StatelessWidget {
  const SectionContainer({
    super.key,
    required this.title,
    this.onTap,
    this.buttonLabel,
    required this.childTile,
    this.horizontalPadding = 16,
    this.color = Colors.white,
    this.isButtonVisible = true,
    this.type = CategoryType.product,
    this.hasProducts = true,
  });
  final String title;
  final Function()? onTap;
  final String? buttonLabel;
  final Widget childTile;
  final double horizontalPadding;
  final Color color;
  final bool isButtonVisible;
  final CategoryType type;
  final bool hasProducts;

  @override
  Widget build(BuildContext context) {
    var show = type == CategoryType.product;
    return Material(
      color: show ? color : null,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            if (show && hasProducts)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 18,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          color: StyleColors.lukhuDark,
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    if (isButtonVisible && hasProducts)
                      InkWell(
                        onTap: onTap,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            buttonLabel ?? 'See All',
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: StyleColors.purple,
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                  ],
                ),
              ),
            if (hasProducts)
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: horizontalPadding,
                ),
                child: childTile,
              )
          ],
        ),
      ),
    );
  }
}
