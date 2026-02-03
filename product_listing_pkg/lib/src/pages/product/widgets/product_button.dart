import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart';

import '../../../../utils/app_util.dart';

class ProductShareBtn extends StatelessWidget {
  const ProductShareBtn({
    super.key,
    this.isLoading = false,
    this.onTap,
  });
  final void Function()? onTap;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: SizedBox(
              height: 10,
              width: 10,
              child: CircularProgressIndicator(
                strokeWidth: 2,
                valueColor:
                    AlwaysStoppedAnimation<Color>(StyleColors.lukhuBlue),
              ),
            ),
          )
        : DefaultIconBtn(
            radius: 15,
            onTap: onTap,
            assetImage: AppUtil.iconSend,
            packageName: AppUtil.packageName,
          );
  }
}
