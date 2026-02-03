import 'package:flutter/material.dart';

import '../../../utils/styles/colors.dart';

class DefaultTextBtn extends StatelessWidget {
  const DefaultTextBtn({
    super.key,
    this.label,
    this.onTap,
    this.child,
    this.underline = true,
  });
  final String? label;
  final void Function()? onTap;
  final Widget? child;
  final bool underline;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      // splashFactory: NoSplash.splashFactory,
      child: child ??
          Text(
            label ?? '',
            style: TextStyle(
                color: StyleColors.lukhuBlue,
                fontWeight: FontWeight.w700,
                fontSize: 12,
                decoration: underline ? TextDecoration.underline : null,
                decorationColor: StyleColors.lukhuBlue),
          ),
    );
  }
}
