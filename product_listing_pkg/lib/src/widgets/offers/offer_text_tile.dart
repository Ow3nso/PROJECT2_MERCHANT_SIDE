import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show StyleColors;


class OfferTextTile extends StatelessWidget {
  const OfferTextTile(
      {super.key,
      required this.title,
      required this.description,
      this.alignment = MainAxisAlignment.start,
      this.titleStyle,
      this.descriptionStyle});
  final String title;
  final String description;
  final MainAxisAlignment alignment;
  final TextStyle? titleStyle;
  final TextStyle? descriptionStyle;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: alignment,
      children: [
        Text(
          title,
          style:
              titleStyle ?? TextStyle(color: StyleColors.gray90, fontSize: 16),
        ),
        Text(description,
            style: descriptionStyle ??
                TextStyle(
                    color: StyleColors.gray90,
                    fontWeight: FontWeight.w700,
                    fontSize: 16))
      ],
    );
  }
}
