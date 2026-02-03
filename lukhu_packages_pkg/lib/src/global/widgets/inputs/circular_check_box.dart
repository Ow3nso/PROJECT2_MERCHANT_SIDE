import 'package:flutter/material.dart';

import '../../../utils/styles/colors.dart';

class CircularCheckbox extends StatelessWidget {
  const CircularCheckbox({
    super.key,
    this.isChecked = false,
    this.onTap,
    this.radius = 8,
  });
  final bool isChecked;
  final void Function()? onTap;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(color: StyleColors.lukhuDividerColor)),
      child: CircleAvatar(
        radius: radius,
        backgroundColor:
            isChecked ? StyleColors.lukhuBlue70 : StyleColors.lukhuWhite,
        child: isChecked
            ? Icon(Icons.check, color: StyleColors.lukhuWhite, size: 10)
            : null,
      ),
    );
  }
}
