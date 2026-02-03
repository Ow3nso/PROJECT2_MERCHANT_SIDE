import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Consumer, StyleColors;
import 'package:product_listing_pkg/src/controller/checkout_controller.dart';

import '../../../../utils/app_util.dart';

class PickLocation extends StatelessWidget {
  const PickLocation(
      {super.key, required this.data, required this.index, this.onTap});
  final Map<String, dynamic> data;
  final int index;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Consumer<CheckoutController>(builder: (context, controller, _) {
      return Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: StyleColors.lukhuWhite,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: StyleColors.lukhuDividerColor,
              ),
            ),
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data['value'],
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: StyleColors.lukhuDark1,
                        ),
                      ),
                      Image.asset(
                        controller.pickUpPoints[index]['isOpen']
                            ? AppUtil.arrowUp
                            : AppUtil.arrowDown,
                        package: AppUtil.packageName,
                      ),
                    ]),
              ),
            ),
          ),
          const SizedBox(height: 10),
          AnimatedContainer(
            duration: AppUtil.animationDuration,
            height: controller.pickUpPoints[index]['isOpen'] ? 300 : 0,
            decoration: BoxDecoration(
              color: StyleColors.lukhuWhite,
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: StyleColors.lukhuDividerColor,
              ),
            ),
            child: ListView.builder(
              itemCount: controller.getLocations(index).length,
              itemBuilder: (context, position) {
                var location = controller.getLocations(index)[position];
                return ListTile(
                  title: Text(
                    location,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 14,
                      color: StyleColors.lukhuDark1,
                    ),
                  ),
                  onTap: () {
                    controller.updateFilterValues(
                      index: index,
                      key: data['name'],
                      value: location,
                    );
                    //controller.collapse(index);
                  },
                  trailing: controller.selectedPoint == location
                      ? Icon(
                          Icons.check,
                          color: StyleColors.lukhuCheckColor,
                        )
                      : null,
                  selected: controller.selectedPoint == location,
                  selectedColor: StyleColors.lukhuGrey500,
                  tileColor: controller.selectedPoint == location
                      ? StyleColors.lukhuBlue
                      : null,
                );
              },
            ),
          ),
          const SizedBox(height: 10),
        ],
      );
    });
  }
}
