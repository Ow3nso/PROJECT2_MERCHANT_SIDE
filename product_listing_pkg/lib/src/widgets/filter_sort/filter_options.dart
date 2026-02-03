import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show Consumer, DefaultSwitch, FilterType, InfoCard, StyleColors;

import '../../controller/filter_sort_controller.dart';

class FilterOptions extends StatelessWidget {
  const FilterOptions({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<FilterSortController>(
        builder: (context, filterSortState, _) {
      return Column(
        children: [
          Divider(color: StyleColors.lukhuDividerColor),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: DefaultSwitch(
              value: filterSortState.activateSizes,
              onChanged: (value) {
                filterSortState.activateSizes = value ?? false;
              },
              controlAffinity: ListTileControlAffinity.trailing,
              activeColor: StyleColors.lukhuBlue,
              inActiveTrackColor: StyleColors.lukhuDividerColor,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'My Sizes',
                    style: TextStyle(
                      color: StyleColors.lukhuDark1,
                      fontWeight: FontWeight.w800,
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    'You can update sizes in settings',
                    style: TextStyle(
                      color: StyleColors.lukhuGrey80,
                      fontWeight: FontWeight.w600,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView.builder(
            itemBuilder: (_, index) {
              var filterValue = filterSortState.filterValues[index];

              return InfoCard(
                data: filterValue,
                onTap: () {
                  filterSortState.filterTitle = filterValue['name']!.toString();
                  filterSortState.selectedFilterValue = filterValue;
                  if (filterSortState.filterTitle == 'Color') {
                    filterSortState.filterValueType = FilterType.color;
                  } else if (filterSortState.filterTitle == 'Price') {
                    filterSortState.filterValueType = FilterType.price;
                  } else {
                    filterSortState.filterValueType = FilterType.other;
                  }
                },
                showBottomBorder:
                    filterSortState.filterValues.length - 1 == index,
              );
            },
            itemCount: filterSortState.filterValues.length,
          )),
          const SizedBox(height: 32)
        ],
      );
    });
  }
}
