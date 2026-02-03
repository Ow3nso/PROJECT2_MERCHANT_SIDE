import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart';

import '../../utils/app_util.dart';

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key,
      this.image,
      required this.store,
      required this.user,
      this.location,
      this.onFollow,
      this.onTap});
  final String? image;
  final String store;
  final String user;
  final String? location;
  final void Function()? onFollow;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding:
          const EdgeInsets.only(bottom: 0, top: 10, right: 10, left: 10),
      horizontalTitleGap: 4,
      leading: CircleAvatar(
        backgroundColor: Theme.of(context).colorScheme.error,
        radius: 32,
        backgroundImage: NetworkImage(image ?? AppUtil.errorAvatar),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(right: 2),
                  child: Text(
                    store,
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: StyleColors.lukhuDark1,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
              Image.asset(
                AppUtil.iconVerifiedSvg,
                package: GlobalAppUtil.productListingPackageName,
              )
            ],
          ),
          if (store.isNotEmpty)
            Text(
              '@$store',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: StyleColors.lukhuDark1,
                fontSize: 10,
              ),
            ),
        ],
      ),
      subtitle: Row(
        children: [
          Icon(
            Icons.location_on,
            size: 10,
            color: StyleColors.lukhuGrey70,
          ),
          if (location != null)
            Expanded(
              child: Text(
                '$location',
                style: TextStyle(
                  color: StyleColors.lukhuGrey70,
                  fontWeight: FontWeight.w400,
                  fontSize: 10,
                ),
              ),
            )
        ],
      ),
      trailing: DefaultButton(
        label: 'Edit Profile',
        color: Theme.of(context).extension<CustomColors>()?.neutral,
        onTap: onFollow,
        width: 120,
        height: 30,
      ),
    );
  }
}
