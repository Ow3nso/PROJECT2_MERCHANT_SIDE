import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart';

class DescriptionTile extends StatelessWidget {
  const DescriptionTile({
    super.key,
    this.allowBold = false,
    required this.title,
    required this.description,
  });
  final bool allowBold;
  final String title, description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Row(
        children: [
          Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
              color: StyleColors.greyWeak1,
              fontWeight: allowBold ? FontWeight.w500 : FontWeight.w400,
              fontSize: allowBold ? 16 : 12,
            ),
          ),
          const Spacer(),
          Expanded(
            child: Text(
              description,
              textAlign: TextAlign.end,
              style: TextStyle(
                color: StyleColors.lukhuDark1,
                fontWeight: allowBold ? FontWeight.w700 : FontWeight.w600,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    );
  }
}
