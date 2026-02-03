import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultButton, FilterCardTitle, ReadContext, StyleColors, WatchContext;
import 'package:product_listing_pkg/src/controller/filter_sort_controller.dart';

import '../../../utils/app_util.dart';
import 'filter_child_display.dart';
import 'filter_options.dart';

class FilterCard extends StatelessWidget {
  FilterCard({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    bool selectOptionChild =
        context.watch<FilterSortController>().showFilterChildren;
    bool selectedColorOption =
        context.watch<FilterSortController>().showFilterColors;
    var title = context.read<FilterSortController>().filterTitle;
    return AnimatedContainer(
        duration: AppUtil.animationDuration,
        decoration: BoxDecoration(
          color: StyleColors.lukhuWhite,
          borderRadius: BorderRadius.circular(20),
        ),
        height:
            selectOptionChild && !selectedColorOption ? height(title!) : 550,
        width: size.width,
        child: Column(
          children: [
            FilterCardTitle(
              title: selectOptionChild
                  ? context.read<FilterSortController>().filterTitle ?? ''
                  : null,
              onTap: selectOptionChild
                  ? () {
                      context.read<FilterSortController>().filterTitle = null;
                    }
                  : null,
              onReset: () {},
            ),
            if (selectOptionChild)
              Expanded(
                child: FilterChildDisplay(
                  data:
                      context.read<FilterSortController>().selectedFilterValue,
                  type: context.read<FilterSortController>().filterValueType,
                ),
              ),
            if (!selectOptionChild)
              const Expanded(
                child: FilterOptions(),
              ),
            DefaultButton(
              onTap: () {
                Navigator.of(context).pop();
              },
              color: StyleColors.lukhuBlue,
              actionDissabledColor: StyleColors.lukhuDisabledButtonColor,
              label: 'View Items',
              height: 40,
              width: size.width - 32,
              style: TextStyle(
                  color: StyleColors.lukhuWhite,
                  fontWeight: FontWeight.w600,
                  fontSize: 16),
            ),
            const SizedBox(
              height: 16,
            ),
            DefaultButton(
              onTap: () {
                context.read<FilterSortController>().filterTitle = null;
                Navigator.of(context).pop();
              },
              label: 'Cancel',
              color: StyleColors.lukhuWhite,
              height: 40,
              width: size.width - 32,
              boarderColor: StyleColors.lukhuDividerColor,
              textColor: StyleColors.lukhuDark1,
            ),
            const SizedBox(
              height: 26,
            ),
          ],
        ));
  }

  final Map<String, double> cardHeight = {
    'Location': 300,
    'Category': 450,
    'Price': 450,
    'Condition': 450,
  };

  double height(String type) => cardHeight[type] ?? 350;
}
