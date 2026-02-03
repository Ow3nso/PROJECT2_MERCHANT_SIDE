import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show GlobalAppUtil;

import '../../../utils/app_util.dart';

class ListingFilterButton extends StatelessWidget {
  const ListingFilterButton({
    Key? key,
    required this.title,
    this.onTap,
    this.image,
    this.packageName,
  }) : super(key: key);

  final String title;
  final void Function()? onTap;
  final String? image;
  final String? packageName;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (image != null)
            Padding(
              padding: const EdgeInsets.only(right: 4),
              child: Image.asset(
                image!,
                package: packageName ?? AppUtil.packageName,
                height: 20,
              ),
            ),
          Text(
            title,
            style: TextStyle(
              color: Theme.of(context).colorScheme.scrim,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
          ),
          const SizedBox(width: 4),
          Image.asset(
            GlobalAppUtil.chevronDown,
            package: GlobalAppUtil.mainPackageName,
          )
        ],
      ),
    );
  }
}
