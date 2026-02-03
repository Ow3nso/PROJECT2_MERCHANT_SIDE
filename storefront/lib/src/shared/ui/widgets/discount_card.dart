import 'package:flutter/material.dart';

class DiscountCard extends StatelessWidget {
  const DiscountCard({
    super.key,
    this.style,
    required this.color,
    this.description = '',
    // required this.iconImage,
    this.width,
    this.imageColor,
    this.onTap,
    this.packageName = 'lukhu_packages_pkg',
  });
  final TextStyle? style;
  final Color color;
  final String description;
  // final Icon iconImage;
  final double? width;
  final Color? imageColor;
  final void Function()? onTap;
  final String packageName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: width,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            25,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.local_offer,
              color: Colors.red,
              size: 10,
            ),
            const SizedBox(width: 4),
            Text(
              description,
              style: style ??
                  TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w800,
                    fontSize: 10,
                  ),
            )
          ],
        ),
      ),
    );
  }
}