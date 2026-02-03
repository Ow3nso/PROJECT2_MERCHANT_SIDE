import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultSwitch, StyleColors;

class FilterCardPriceRange extends StatelessWidget {
  const FilterCardPriceRange(
      {super.key,
      required this.value,
      required this.onChanged,
      required this.rangeValue,
      this.itemOnSalePicked = false,
      required this.onItemSalePicked,
      this.isItemWithFreeShipping = false,
      required this.onItemWithFreeShipping,
      this.minimumValue = 0,
      this.maximumValue = 1000});

  /// The value of the slider.
  final double value;

  /// A function that takes a RangeValues as a parameter and returns nothing.
  final void Function(RangeValues) onChanged;

  /// A variable that is used to store the value of the slider.
  final RangeValues rangeValue;

  /// A variable that is used to store the value of the slider.
  final bool itemOnSalePicked;

  /// A function that takes a bool as a parameter and returns nothing.
  final void Function(bool?) onItemSalePicked;

  /// A variable that is used to store the value of the slider.
  final bool isItemWithFreeShipping;

  /// A function that takes a bool as a parameter and returns nothing.
  final void Function(bool?) onItemWithFreeShipping;

  /// A variable that is used to store the value of the slider.
  final double maximumValue;

  /// A variable that is used to store the value of the slider.
  final double minimumValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Divider(color: StyleColors.lukhuDividerColor),

        /// A text widget that is aligned to the top left of the screen.
        Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                'up to Ksh ${value.truncate()}',
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: StyleColors.lukhuDark1,
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              )),
        ),
        SliderTheme(
          data: SliderThemeData(
            overlayColor: StyleColors.lukhuBlue0,
            thumbColor: StyleColors.lukhuWhite,
            activeTrackColor: StyleColors.lukhuBlue70,
            trackHeight: 6.6,
            overlappingShapeStrokeColor: StyleColors.lukhuBlue0,
          ),
          child: RangeSlider(
            min: minimumValue,
            max: maximumValue,
            inactiveColor: StyleColors.lukhuBlue0,
            values: rangeValue,
            onChanged: onChanged,
          ),
        ),
        Divider(color: StyleColors.lukhuDividerColor),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DefaultSwitch(
            onChanged: onItemSalePicked,
            value: itemOnSalePicked,
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: StyleColors.lukhuBlue,
            inActiveTrackColor: StyleColors.lukhuDividerColor,
            title: Text(
              'Items on Sale',
              style: TextStyle(
                color: StyleColors.lukhuDark1,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Divider(color: StyleColors.lukhuDividerColor),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: DefaultSwitch(
            onChanged: onItemWithFreeShipping,
            value: isItemWithFreeShipping,
            controlAffinity: ListTileControlAffinity.trailing,
            activeColor: StyleColors.lukhuBlue,
            inActiveTrackColor: StyleColors.lukhuDividerColor,
            title: Text(
              'Items with free shipping*',
              style: TextStyle(
                color: StyleColors.lukhuDark1,
                fontWeight: FontWeight.w800,
                fontSize: 18,
              ),
            ),
          ),
        ),
        Divider(color: StyleColors.lukhuDividerColor),
      ],
    );
  }
}
