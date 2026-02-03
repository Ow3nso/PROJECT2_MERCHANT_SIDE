import 'package:flutter/material.dart';

import '../../utils/app_util.dart';

class SettingTile extends StatelessWidget {
  const SettingTile(
      {super.key,
      this.image,
      this.packageName,
      required this.title,
      this.subTitle = '',
      this.onTap});
  final String? image;
  final String? packageName;
  final String title;
  final String subTitle;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: ListTile(
        contentPadding: const EdgeInsets.only(left: 16, right: 16),
        horizontalTitleGap: 0,
        title: Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).colorScheme.scrim,
            fontSize: 14,
          ),
        ),
        splashColor: Colors.transparent,
        selected: true,
        subtitle: Text(
          subTitle,
          style: TextStyle(
            fontWeight: FontWeight.w400,
            color: Theme.of(context).colorScheme.scrim,
            fontSize: 12,
          ),
        ),
        leading: Image.asset(
          image ?? AppUtil.callIcon,
          package: packageName ?? AppUtil.packageName,
        ),
      ),
    );
  }
}
