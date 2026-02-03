import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show StyleColors;

class FilterColorText extends StatelessWidget {
  const FilterColorText({super.key, required this.color, required this.value});
  final Color? color;
  final String? value;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: color ?? StyleColors.lukhuDark,
          radius: 8,
        ),
        const SizedBox(width: 8),
        Text(
          value ?? 'Black',
          style: TextStyle(
              color: StyleColors.lukhuDark1,
              fontSize: 12,
              fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
