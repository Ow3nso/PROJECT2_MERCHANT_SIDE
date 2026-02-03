import 'package:flutter/material.dart' hide Badge;
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show Badge, BadgePosition, BadgeStyle;

import '../../utils/app_util.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key, this.onTap, this.image});
  final void Function()? onTap;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return Badge(
      badgeStyle: BadgeStyle(
        badgeColor: Theme.of(context).colorScheme.onPrimary,
      ),
      position: BadgePosition.bottomEnd(
        bottom: 3,
        end: 2,
      ),
      onTap: onTap,
      badgeContent: Image.asset(
        AppUtil.editIcon,
        package: AppUtil.packageName,
        height: 20,
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(50),
        child: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.error,
          radius: 50,
          backgroundImage: image == null ? null : NetworkImage(image!),
        ),
      ),
    );
  }
}
