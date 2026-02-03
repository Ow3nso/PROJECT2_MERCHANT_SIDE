import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show StyleColors;

class StepperTitle extends StatelessWidget {
  const StepperTitle(
      {super.key,
      required this.index,
      required this.title,
      this.isActive = false,
      this.showDivider = true,
      this.onTap,
      required this.data});
  final int index;
  final String title;
  final bool isActive;
  final bool showDivider;
  final void Function()? onTap;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashFactory: NoSplash.splashFactory,
      onTap: onTap,
      child: Row(
        children: [
          Container(
            height: 24,
            width: 24,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: data['isComplete']
                    ? StyleColors.lukhuSuccess200
                    : StyleColors.lukhuWhite,
                shape: BoxShape.circle,
                border: Border.all(
                    color: isActive
                        ? StyleColors.lukhuDark1
                        : StyleColors.lukhuGrey80)),
            child: data['isComplete']
                ? Icon(
                    Icons.check,
                    color: StyleColors.lukhuWhite,
                    size: 15,
                  )
                : Text(
                    '$index',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: isActive
                            ? StyleColors.lukhuDark1
                            : StyleColors.lukhuGrey80,
                        fontWeight:
                            isActive ? FontWeight.w600 : FontWeight.w500,
                        fontSize: 12),
                  ),
          ),
          const SizedBox(width: 6),
          Text(
            data['title'],
            style: TextStyle(
                color: isActive || data['isComplete']
                    ? StyleColors.lukhuDark1
                    : StyleColors.lukhuGrey80,
                fontWeight: isActive || data['isComplete']
                    ? FontWeight.w700
                    : FontWeight.w500,
                fontSize: 12),
          ),
          const SizedBox(
            width: 10,
          ),
          if (showDivider)
            Container(
              height: 1,
              width: 40,
              decoration: BoxDecoration(
                  color: isActive
                      ? StyleColors.lukhuDark1
                      : data['isComplete']
                          ? StyleColors.lukhuSuccess200
                          : StyleColors.lukhuGrey80),
            )
        ],
      ),
    );
  }
}
