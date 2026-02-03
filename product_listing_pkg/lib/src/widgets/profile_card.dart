import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show GlobalAppUtil, ReadContext, StyleColors;
import 'package:product_listing_pkg/src/controller/shop_controller.dart';

import '../../utils/app_util.dart';
import 'content_loader.dart';

enum ViewTitleType { rating, verified, other }

class ProfileCard extends StatelessWidget {
  const ProfileCard(
      {super.key,
      this.image,
      this.store = '',
      this.user = '',
      this.location,
      this.onTap,
      this.radius = 16,
      this.type = ViewTitleType.other,
      this.shopId = '',
      this.trailing});
  final String? image;
  final String store;
  final String user;
  final String? location;
  final ViewTitleType type;
  final void Function()? onTap;
  final double radius;
  final Widget? trailing;
  final String shopId;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: context.read<ShopController>().getUserShop(shopId: shopId),
        builder: (_, snapshot) {
          if (snapshot.hasData) {
            var shop = snapshot.data;
            if (shop!.isEmpty) {
              return Container(
                height: 50,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.center,
                child: Text(
                  'Shop data not available at the moment',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.scrim,
                      fontWeight: FontWeight.w600,
                      fontSize: 12),
                ),
              );
            }
            var userShop = context.read<ShopController>().shop(0, shop);
            return ListTile(
                onTap: onTap,
                contentPadding: const EdgeInsets.only(
                  bottom: 0,
                  top: 10,
                ),
                horizontalTitleGap: 4,
                leading: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.error,
                  radius: radius,
                  backgroundImage: userShop!.imageUrl == null
                      ? null
                      : NetworkImage(userShop.imageUrl!),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 2),
                          child: Text(
                            userShop.name!,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: StyleColors.lukhuDark1,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        if (userShop.isVerified ?? false)
                          Image.asset(
                            AppUtil.iconVerifiedSvg,
                            package: GlobalAppUtil.productListingPackageName,
                          ),
                      ],
                    ),
                    if (type == ViewTitleType.verified)
                      Text(
                        '@${userShop.name}',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: StyleColors.lukhuDark1,
                          fontSize: 10,
                        ),
                      ),
                    Row(
                      children: [
                        if (type == ViewTitleType.verified &&
                            (userShop.isVerified ?? false))
                          Icon(
                            Icons.location_on,
                            size: 10,
                            color: StyleColors.lukhuGrey70,
                          ),
                        if (userShop.city != null)
                          Expanded(
                            child: Text(
                              '${userShop.city}',
                              style: TextStyle(
                                color: StyleColors.lukhuGrey70,
                                fontWeight: FontWeight.w400,
                                fontSize: 10,
                              ),
                            ),
                          )
                      ],
                    ),
                    if (type == ViewTitleType.rating &&
                        userShop.shopRating != 0)
                      Row(
                        children: List.generate(
                            5,
                            (index) => Icon(Icons.star,
                                size: 10,
                                color: index == 4
                                    ? StyleColors.lukhuDividerColor
                                    : StyleColors.rateColor)),
                      )
                  ],
                ),
                trailing: trailing);
          }
          return const ContentLoader();
        });
  }
}
