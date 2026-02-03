import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultCheckbox, ReadContext, StyleColors, WatchContext;
import 'package:product_listing_pkg/utils/app_util.dart';

import '../../../utils/dialogues.dart';
import '../../controller/search_controller.dart';
import '../../pages/home/widgets/sort_card.dart';
import 'filter_card.dart';
import 'filter_listing_btn.dart';

class FilterRow extends StatelessWidget {
  const FilterRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        color: StyleColors.lukhuWhite,
      ),
      child: Row(
        children: [
          Expanded(
            child: ListingFilterButton(
              onTap: () {
                LukhuDialogue.blurredDialogue(
                  distance: 0,
                  child: FilterCard(),
                  context: context,
                );
              },
              title: 'Filter',
              image: AppUtil.filterListingIcon,
            ),
          ),
          Container(
            height: 32,
            width: 1,
            decoration: BoxDecoration(
              color: StyleColors.lukhuDividerColor,
            ),
          ),
          Expanded(
            child: ListingFilterButton(
              onTap: () {
                LukhuDialogue.blurredDialogue(
                  distance: 0,
                  child: const SortCard(
                    title: 'Sort',
                  ),
                  context: context,
                );
              },
              title: 'Sort',
              image: AppUtil.sortListingIcon,
            ),
          ),
          Container(
            height: 32,
            width: 1,
            decoration: BoxDecoration(
              color: StyleColors.lukhuDividerColor,
            ),
          ),
          Expanded(
            child: DefaultCheckbox(
              activeColor: StyleColors.lukhuBlue10,
              checkedColor: StyleColors.lukhuBlue70,
              value: context.watch<ProductSearchController>().showOnSale,
              onChanged: (value) {
                context.read<ProductSearchController>().showOnSale = value ?? false;
              },
              title: Text(
                'On Sale',
                style: TextStyle(
                  color: StyleColors.lukhuError,
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
