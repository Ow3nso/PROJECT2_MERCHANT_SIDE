import 'package:dukastax_pkg/utils/app_util.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show StyleColors;

class PageContent extends StatelessWidget {
  const PageContent({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      child: Column(
        children: [
          const Spacer(),
          Image.asset(
            data["image"],
            package: AppUtil.packageName,
          ),
          Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 15, left: 16, right: 16),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  data["title"],
                  style: TextStyle(
                    color: StyleColors.lukhuDark,
                    fontWeight: FontWeight.w700,
                    fontSize: 24,
                  ),
                  textAlign: TextAlign.center,
                )),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                Expanded(
                    child: Text(
                  data["description"],
                  style: TextStyle(
                    color: StyleColors.lukhuDark,
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                )),
              ],
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
