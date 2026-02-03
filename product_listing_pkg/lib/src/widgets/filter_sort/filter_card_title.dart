import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show DefaultBackButton, StyleColors;


class FilterCardTitle extends StatelessWidget {
  const FilterCardTitle({Key? key, this.title, this.onTap}) : super(key: key);
  final String? title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          DefaultBackButton(
            onTap: onTap,
            alignment: Alignment.topLeft,
          ),
          Text(
            title ?? 'Filter',
            style: TextStyle(
              color: StyleColors.lukhuDark1,
              fontWeight: FontWeight.w800,
              fontSize: 16,
            ),
          ),
          TextButton(
            onPressed: () {},
            child: Text(
              'Reset',
              style: TextStyle(
                  color: StyleColors.lukhuOrange200,
                  fontWeight: FontWeight.w600,
                  fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}
