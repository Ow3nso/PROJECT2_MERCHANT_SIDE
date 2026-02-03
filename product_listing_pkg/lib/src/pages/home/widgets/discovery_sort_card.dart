import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show Consumer, DefaultButton, StyleColors, WatchContext;
import 'package:product_listing_pkg/src/controller/filter_sort_controller.dart';
import 'package:product_listing_pkg/utils/app_util.dart';

class DiscoverySortCard extends StatefulWidget {
  const DiscoverySortCard({super.key});

  @override
  State<DiscoverySortCard> createState() => _DiscoverySortCardState();
}

class _DiscoverySortCardState extends State<DiscoverySortCard> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 400,
      decoration: BoxDecoration(
        color: StyleColors.lukhuWhite,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.only(
        right: 16,
        left: 16,
      ),
      child: Column(
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 30,
            backgroundColor: StyleColors.lightPink,
            child: Image.asset(
              AppUtil.sortIcon,
              package: AppUtil.packageName,
              height: 24,
              width: 24,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            'Sort Posts By',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: StyleColors.lukhuDark1,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          // const SizedBox(height: 16),
          Expanded(
            child: ListView.builder(
              itemCount: context
                  .watch<FilterSortController>()
                  .discoverSortOptions
                  .length,
              itemBuilder: (context, index) {
                return Consumer<FilterSortController>(
                    builder: (context, filterSortState, _) {
                  var item = filterSortState.discoverSortOptions[index];
                  return RadioListTile<String>(
                    value: item,
                    groupValue: filterSortState.selectedSortItem,
                    onChanged: (value) =>
                        filterSortState.selectedSortItem = value!,
                    activeColor: StyleColors.lukhuBlue,
                    title: Text(
                      item,
                      style: TextStyle(
                        color: StyleColors.lukhuDark1,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                });
              },
            ),
          ),
          DefaultButton(
            onTap: () {
              Navigator.of(context).pop();
            },
            color: StyleColors.lukhuWhite,
            boarderColor: StyleColors.lukhuDividerColor,
            actionDissabledColor: StyleColors.lukhuDisabledButtonColor,
            label: 'Cancel',
            height: 40,
            width: size.width - 32,
            textColor: StyleColors.lukhuDark1,
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
