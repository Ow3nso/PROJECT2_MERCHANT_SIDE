import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultIconBtn, ReadContext;

import '../../../../utils/app_util.dart';
import '../../../controller/product_controller.dart';

class LikeButton extends StatelessWidget {
  const LikeButton({super.key, required this.productId, this.isLiked = false});
  final String productId;
  final bool isLiked;

  @override
  Widget build(BuildContext context) {
    return DefaultIconBtn(
      radius: 15,
      onTap: () {
        context.read<ProductController>().likeProduct(productId: productId);
      },
      assetImage: isLiked ? AppUtil.likedHeart : AppUtil.iconHeart,
      packageName: AppUtil.packageName,
    );
  }
}
