import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show CircularCheckbox, LocationModel, StyleColors;

import '../../../../../utils/app_util.dart';
import '../checkout_pop_card.dart';

class UserLocation extends StatelessWidget {
  const UserLocation({
    super.key,
    required this.location,
    this.showCheck = false,
    this.type = CheckoutPopType.none,
    this.onTap,
    this.color,
  });
  final LocationModel location;
  final bool showCheck;
  final CheckoutPopType type;
  final Function()? onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color ??
            (!(location.isSelected ?? false)
            ? StyleColors.lukhuWhite
            : StyleColors.lukhuBlue0),
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: StyleColors.lukhuDividerColor,
        ),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CircleAvatar(
                backgroundColor: location.isSelected ?? false
                    ? StyleColors.lukhuWhite
                    : StyleColors.lukhuBlue0,
                radius: 16,
                child: Image.asset(
                    AppUtil.getLocationIcon(location.locationType!),
                    package: AppUtil.packageName,
                    color: StyleColors.lukhuBlue,
                    height: 13),
              ),
              const SizedBox(
                width: 9,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (type == CheckoutPopType.review)
                      Text(
                        'Shipping Details',
                        style: TextStyle(
                          color: StyleColors.lukhuGrey60,
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                      ),
                    Row(
                      children: [
                        Text(
                          location.locationType!,
                          style: TextStyle(
                            color: (location.isSelected ?? false)
                                ? StyleColors.lukhuBlue
                                : StyleColors.gray90,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        if (showCheck && type != CheckoutPopType.review)
                          CircularCheckbox(
                            isChecked: location.isSelected ?? false,
                          )
                      ],
                    ),
                    Text(
                      '${location.buildingHouse} ${location.location!}',
                      style: TextStyle(
                        color: location.isSelected ?? false
                            ? StyleColors.lukhuBlue
                            : StyleColors.gray90,
                        fontWeight: FontWeight.w400,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
