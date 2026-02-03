import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show StyleColors;

import '../../utils/app_util.dart';

enum ListingBtnType { img, other }

class ListingBtn extends StatelessWidget {
  const ListingBtn(
      {super.key,
      this.onTap,
      required this.data,
      this.type = ListingBtnType.other});
  final void Function()? onTap;
  final ListingBtnType type;
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: InkWell(
            splashFactory: NoSplash.splashFactory,
            onTap: onTap,
            child: Row(
              children: [
                if (type == ListingBtnType.img)
                  Image.asset(
                    data['image'],
                    package: AppUtil.packageName,
                  ),
                if (type == ListingBtnType.img) const SizedBox(width: 8),
                Text(
                  data['title'],
                  style: TextStyle(
                      color: StyleColors.lukhuGrey80,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Expanded(
                  child: Container(),
                ),
                if (data['count'] != null)
                  Text(
                    data['count'],
                    style: TextStyle(
                        color: StyleColors.lukhuDividerColor,
                        fontSize: 16,
                        fontWeight: FontWeight.w400),
                  ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward_ios,
                  color: StyleColors.lukhuDark1,
                  size: 15,
                )
              ],
            ),
          ),
        ),
        if (type == ListingBtnType.other)
          Divider(color: StyleColors.lukhuDividerColor),
      ],
    );
  }
}
