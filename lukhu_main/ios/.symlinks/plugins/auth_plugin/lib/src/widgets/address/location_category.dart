import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        DiscountCard,
        GlobalAppUtil,
        LocationController,
        ReadContext,
        StyleColors,
        WatchContext;

class LocationCategory extends StatelessWidget {
  const LocationCategory({
    super.key,
    this.locationCategory = const [],
  });
  final List<Map<String, dynamic>> locationCategory;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(locationCategory.length, (index) {
        var data = locationCategory[index];
        return DiscountCard(
          width: 90,
          onTap: () {
            context.read<LocationController>().selectedLabel = index;
            context.read<LocationController>().locationType = data['title'];
          },
          iconImage: data['image'],
          color: context.watch<LocationController>().isLabelSelected(index)
              ? StyleColors.pink
              : StyleColors.lukhuGrey,
          imageColor: context.watch<LocationController>().isLabelSelected(index)
              ? StyleColors.white
              : null,
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 12,
            color: context.watch<LocationController>().isLabelSelected(index)
                ? StyleColors.white
                : StyleColors.gray90,
          ),
          description: data['title'],
          packageName: GlobalAppUtil.productListingPackageName,
        );
      }),
    );
  }
}
