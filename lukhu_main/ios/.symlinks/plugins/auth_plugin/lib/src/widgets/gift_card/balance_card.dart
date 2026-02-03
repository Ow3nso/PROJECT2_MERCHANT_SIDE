import 'package:auth_plugin/src/pages/terms_and_condition.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        CustomColors,
        DateFormat,
        DefaultBackButton,
        DefaultButton,
        DeliveryStatus,
        DetailCard,
        GlobalAppUtil,
        NavigationService,
        StyleColors;

import '../../utils/app_util.dart';
import 'payment_icon.dart';

enum GiftType { user, verify }

class GiftCardBalance extends StatelessWidget {
  GiftCardBalance(
      {super.key, required this.label, this.onTap, this.type = GiftType.user});
  final String label;
  final void Function()? onTap;
  final GiftType type;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: cardHeight(type.name),
      width: size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: StyleColors.lukhuDividerColor),
      ),
      padding: const EdgeInsets.only(left: 16, top: 16, bottom: 16),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const PaymentIcon(height: 50, width: 50),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 12, top: 5.5),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        label,
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.scrim,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Today ${DateFormat('HH:mm').format(DateTime.now())}',
                        style: TextStyle(
                          color: StyleColors.lukhuGrey80,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              DefaultBackButton(
                assetIcon: GlobalAppUtil.closeIcon,
                packageName: GlobalAppUtil.productListingPackageName,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 33, right: 16),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: GlobalAppUtil.deliveryTextColor(
                            DeliveryStatus.delivered)!
                        .first,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    'KSh 400',
                    style: TextStyle(
                      color: GlobalAppUtil.deliveryTextColor(
                              DeliveryStatus.delivered)!
                          .last,
                      fontWeight: FontWeight.w600,
                      fontSize: 32,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: DetailCard(
                    title: 'Gift Card Number',
                    description: '12937987378930',
                    child: Image.asset(
                      AppUtil.copyIcon,
                      package: GlobalAppUtil.lukhuPayPackageName,
                    ),
                    onTap: () {},
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  child: DetailCard(
                    title: 'Gift Card Pin',
                    description: '1234',
                    child: Image.asset(
                      AppUtil.copyIcon,
                      package: GlobalAppUtil.lukhuPayPackageName,
                    ),
                    onTap: () {},
                  ),
                ),
                if (type == GiftType.verify)
                  DetailCard(
                    description: 'View our Terms and Conditions',
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Theme.of(context).colorScheme.scrim,
                      size: 15,
                    ),
                    onTap: () {
                      Navigator.of(context).pop();
                      NavigationService.navigate(
                          context, TermsConditionPage.routeName);
                    },
                  ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8, top: 8),
                  child: DefaultButton(
                    label: 'Okay',
                    onTap: onTap,
                    width: size.width - 32,
                    height: 40,
                    color: Theme.of(context).extension<CustomColors>()?.neutral,
                  ),
                ),
                if (type == GiftType.verify)
                  DefaultButton(
                    label: 'Cancel',
                    onTap: () {
                      Navigator.of(context).pop(true);
                    },
                    width: size.width - 32,
                    height: 40,
                    textColor: Theme.of(context).colorScheme.scrim,
                    boarderColor: StyleColors.lukhuDividerColor,
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  final Map<String, double> height = {'user': 376, 'verify': 458};

  double cardHeight(String type) => height[type] ?? 400;
}
