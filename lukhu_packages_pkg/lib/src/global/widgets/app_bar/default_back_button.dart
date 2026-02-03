import 'package:flutter/material.dart';

import '../../../utils/app_util.dart';

class DefaultBackButton extends StatelessWidget {
  const DefaultBackButton(
      {super.key,
      this.height,
      this.width,
      this.onTap,
      this.assetIcon,
      this.alignment = Alignment.center,
      this.packageName});
  final double? height;
  final double? width;
  final void Function()? onTap;
  final Alignment alignment;
  final String? assetIcon;
  final String? packageName;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      alignment: alignment,
      icon: Image.asset(
        assetIcon ?? AppUtil.arrowLeft,
        height: height,
        width: width,
        package: packageName ?? AppUtil.packageName,
      ),
      onPressed: () {
        if (onTap == null) {
          Navigator.pop(context);
        } else {
          onTap!();
        }
      },
    );
  }
}
