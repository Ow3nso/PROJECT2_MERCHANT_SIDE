import 'package:flutter/material.dart';

class CustomPreferredSizeWidget extends StatelessWidget
    implements PreferredSizeWidget {
  final Widget? child;
  final double height;

  const CustomPreferredSizeWidget({super.key, this.child, this.height = 0});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: child,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height);
}
