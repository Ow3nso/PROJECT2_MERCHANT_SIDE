import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart';

class InfoButton extends StatelessWidget {
  const InfoButton({
    super.key,
    required this.title,
    required this.description,
    this.onTap,
  });
  final String title;
  final String description;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          child: InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: onTap,
            child: Row(
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: StyleColors.lukhuGrey80,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                const Spacer(),
                Text(
                  description,
                  style: TextStyle(
                      color: StyleColors.lukhuDividerColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: StyleColors.lukhuDark1,
                    size: 15,
                  ),
                )
              ],
            ),
          ),
        ),
        Divider(color: StyleColors.lukhuDividerColor),
      ],
    );
  }
}
