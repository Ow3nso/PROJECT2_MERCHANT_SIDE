import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show StyleColors;

import '../../utils/app_util.dart';

class FloatContainer extends StatelessWidget {
  const FloatContainer({
    super.key,
    this.width,
    this.height,
    required this.child,
    this.padding,
    this.color,
    this.radius = 8,
  });
  final double? width;
  final double? height;
  final Widget child;
  final EdgeInsets? padding;
  final Color? color;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      width: width ?? 187,
      height: height ?? 40,
      decoration: BoxDecoration(
        color: color ?? StyleColors.blue,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: child,
    );
  }
}

class FloatLabelButton extends StatelessWidget {
  const FloatLabelButton({
    super.key,
    required this.label,
    required this.imageAsset,
    this.onTap,
    this.padding,
    this.isImageSVG = false,
    this.alignment = MainAxisAlignment.center,
    this.style,
    this.color,
  });
  final String label;
  final String imageAsset;
  final void Function()? onTap;
  final EdgeInsets? padding;
  final bool isImageSVG;
  final MainAxisAlignment alignment;
  final TextStyle? style;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: padding ??
            const EdgeInsets.symmetric(
              horizontal: 14,
              vertical: 10,
            ),
        decoration: BoxDecoration(
          color: color ?? StyleColors.blue,
        ),
        child: Row(
          mainAxisAlignment: alignment,
          children: [
            Image.asset(
              imageAsset,
              height: 20,
              width: 20,
              package: AppUtil.packageName,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              label,
              style: style ??
                  TextStyle(
                    color: StyleColors.lukhuWhite,
                    fontWeight: FontWeight.w800,
                    fontSize: 14,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
