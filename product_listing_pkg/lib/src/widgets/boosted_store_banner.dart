import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultButton, StyleColors;

import '../../../../utils/app_util.dart';

class BoostedStoreBanner extends StatelessWidget {
  const BoostedStoreBanner({
    super.key,
    this.onCallback,
    required this.backgroundBanner,
    required this.shopBanner,
    this.hasStores = true,
  });
  final void Function()? onCallback;
  final String backgroundBanner;
  final String shopBanner;
  final bool hasStores;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            StyleColors.pink.withOpacity(
              .7,
            ),
            BlendMode.srcOver,
          ),
          image: AssetImage(
            backgroundBanner,
            package: AppUtil.packageName,
          ),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 18,
        ),
        child: Row(
          children: [
            Row(
              children: [
                if (shopBanner.isNotEmpty)
                  Image.asset(
                    shopBanner,
                    width: 24,
                    height: 24,
                    package: AppUtil.packageName,
                  ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  'Boosted Stores',
                  style: TextStyle(
                    color: StyleColors.lukhuWhite,
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            Expanded(
              child: Container(),
            ),
            if (hasStores)
              DefaultButton(
                onTap: onCallback,
                label: 'See All',
                color: StyleColors.lukhuWhite,
                height: 30,
                width: 70,
                boarderColor: StyleColors.lukhuDividerColor,
                textColor: StyleColors.lukhuDark1,
              ),
          ],
        ),
      ),
    );
  }
}
