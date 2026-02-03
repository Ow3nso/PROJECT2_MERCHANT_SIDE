import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        Consumer,
        FilterCardPriceRange,
        FilterColor,
        FilterType,
        InfoCard,
        InfoCardType;
import '../../controller/filter_sort_controller.dart';

class FilterChildDisplay extends StatelessWidget {
  const FilterChildDisplay({
    super.key,
    required this.data,
    required this.type,
  });
  final Map<String, dynamic> data;
  final FilterType type;

  @override
  Widget build(BuildContext context) {
    var listData = data['options'];
    return Consumer<FilterSortController>(
      builder: (context, filterSortState, child) {
        if (type == FilterType.color) {
          return FilterColor(
            onTap: (value) {
              // print('[VALUE]===$value');
              filterSortState.updateFilterValues(
                  key: filterSortState.filterTitle!, value: value['name']);
              filterSortState.chooseAnyColor = false;
            },
            onChanged: (value) {
              filterSortState.chooseAnyColor = value ?? false;

              if (filterSortState.chooseAnyColor) {
                filterSortState.updateFilterValues(
                    key: filterSortState.filterTitle!, value: 'Any');
              }
            },
            isSelected: filterSortState.chooseAnyColor,
            data: listData,
            isColorSame: (value) => filterSortState.isColorValueSame(
                filterSortState.filterTitle!, value),
          );
        } else if (type == FilterType.price) {
          return FilterCardPriceRange(
            value: filterSortState.endPrice,
            onChanged: (value) {
              filterSortState.startPrice = value.start;
              filterSortState.endPrice = value.end;
            },
            rangeValue: RangeValues(
                filterSortState.startPrice, filterSortState.endPrice),
            itemOnSalePicked: filterSortState.chooseItemsOnSale,
            onItemSalePicked: (value) {
              filterSortState.chooseItemsOnSale = value ?? false;
            },
            isItemWithFreeShipping: filterSortState.chooseItemsWithFreeShipping,
            onItemWithFreeShipping: (value) {
              filterSortState.chooseItemsWithFreeShipping = value ?? false;
            },
          );
        } else {
          return ListView.builder(
            itemCount: listData.length,
            itemBuilder: (_, i) {
              final value = listData[i];
              return InfoCard(
                data: {'name': value, 'value': ''},
                type: InfoCardType.edit,
                onTap: () {
                  filterSortState.updateFilterValues(
                      key: filterSortState.filterTitle ?? '', value: value);
                  filterSortState.filterTitle = null;
                },
                showBottomBorder: listData.length - 1 == i,
              );
              // return Padding(
              //   padding:
              //       const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
              //   child: InkWell(
              //     onTap: () {
              //       filterSortState.updateFilterValues(
              //           key: filterSortState.filterTitle ?? '', value: value);
              //       filterSortState.filterTitle = null;
              //     },
              //     child: Row(children: [
              //       Text(value,
              //           style: TextStyle(
              //               color: StyleColors.lukhuDark1,
              //               fontWeight: FontWeight.w400,
              //               fontSize: 20))
              //     ]),
              //   ),
              // );
            },
          );
        }
      },
    );
  }
}
