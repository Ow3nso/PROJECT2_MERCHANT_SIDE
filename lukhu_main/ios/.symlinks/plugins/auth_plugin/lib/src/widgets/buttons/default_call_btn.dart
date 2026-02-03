import 'package:auth_plugin/src/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultIconBtn, GlobalAppUtil;

import '../../utils/app_util.dart';

class DefaultCallBtn extends StatelessWidget {
  const DefaultCallBtn({
    super.key,
    this.phone = '0746553470',
    this.color,
  });
  final String phone;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return DefaultIconBtn(
        assetImage: AppUtil.callIcon,
        backgroundColor: color,
        onTap: () {
          if (phone.isNotEmpty) {
            Helpers.launchInBrowser(
                Uri.parse('tel:${phone.replaceAll(' ', '')}'));
          }
        },
        packageName: GlobalAppUtil.productListingPackageName);
  }
}
