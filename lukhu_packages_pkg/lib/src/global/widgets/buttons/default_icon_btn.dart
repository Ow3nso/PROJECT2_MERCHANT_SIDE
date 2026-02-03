import 'package:flutter/material.dart';



class DefaultIconBtn extends StatelessWidget {
  const DefaultIconBtn(
      {super.key,
      this.assetImage,
      this.onTap,
      this.height,
      this.width,
      this.child,
      this.radius = 10,
      this.backgroundColor,
      this.packageName  = 'lukhu_packages_pkg'
      });
  final String? assetImage;
  final double? height;
  final double? width;
  final void Function()? onTap;
  final Widget? child;
  final double radius;
  final Color? backgroundColor;
  final String packageName;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor??Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: child ??
            Image.asset(
              assetImage!,
              height: height,
              width: width,
              package: packageName,
            ),
      ),
    );
  }
}
