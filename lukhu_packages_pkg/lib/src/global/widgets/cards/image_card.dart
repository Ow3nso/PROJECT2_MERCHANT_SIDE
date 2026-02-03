import 'package:flutter/material.dart';

import '../../../../lukhu_packages_pkg.dart';

class ImageCard extends StatelessWidget {
  const ImageCard(
      {super.key,
      required this.image,
      this.fit,
      this.width,
      this.height,
      this.errorWidget,
      this.placeholder,});
  final String image;
  final BoxFit? fit;
  final double? height;
  final double? width;
  final Widget? errorWidget;
  final Widget? placeholder;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: image,
      fit: fit ?? BoxFit.contain,
      width: width,
      height: height,
      placeholder: (context, url) => placeholder?? const DefaultShimmer(),
      errorWidget: (context, url, error) => errorWidget ?? const HourGlass(),
    );
  }
}

class DefaultShimmer extends StatelessWidget {
  const DefaultShimmer({super.key, this.child, this.enabled = true});
  final Widget? child;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      enabled: enabled,
      child: child ?? Container(),
    );
  }
}
