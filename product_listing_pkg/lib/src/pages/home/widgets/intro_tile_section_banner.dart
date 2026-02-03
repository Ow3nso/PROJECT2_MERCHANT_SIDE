import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show StyleColors;

class IntroTileSectionBanner extends StatelessWidget {
  const IntroTileSectionBanner({
    super.key,
    this.data = const [],
  });
  final List<int> data;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 11,
        bottom: 8,
      ),
      child: Row(
        children: [
          Expanded(
              child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                4,
                (i) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Material(
                      borderRadius: BorderRadius.circular(8),
                      color: i % 2 == 0
                          ? StyleColors.lukhuWarning
                          : StyleColors.lukhuWhite,
                      child: const SizedBox(
                        width: 300,
                        height: 123,
                      ),
                    )),
              ),
            ),
          ))
        ],
      ),
    );
  }
}
