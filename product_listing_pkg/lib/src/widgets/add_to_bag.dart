import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show StyleColors;

import '../../utils/app_util.dart';

class AddToBagBtn extends StatelessWidget {
  const AddToBagBtn({Key? key, required this.onTap, this.activeCart = false})
      : super(key: key);

  final void Function()? onTap;
  final bool activeCart;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: StyleColors.lukhuWhite,
      child: InkWell(
          onTap: onTap,
          child: AnimatedSwitcher(
            duration: AppUtil.animationDuration,
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child);
            },
            child: activeCart
                ? Image.asset(
                    AppUtil.activeCart,
                    package: AppUtil.packageName,
                    key: const ValueKey('active'),
                  )
                : Image.asset(
                    AppUtil.bagImage,
                    package: AppUtil.packageName,
                    key: const ValueKey('in-active'),
                  ),
          )),
    );
  }
}
