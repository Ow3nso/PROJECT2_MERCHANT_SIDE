import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show NavigationService, ReadContext, StyleColors, WatchContext;
import 'package:product_listing_pkg/src/controller/search_controller.dart';
import 'package:product_listing_pkg/src/pages/search/widgets/search_item.dart';

import '../../../../utils/app_util.dart';
import '../../product/pages/product_listing_view.dart';

class SearchMenu extends StatelessWidget {
  const SearchMenu({super.key, this.data = const []});
  final List<Map<String, dynamic>> data;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      height: size.height,
      width: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: List.generate(data.length, (index) {
              return SearchMenuItem(
                isSelected:
                    context.watch<ProductSearchController>().selecetedMenuItem ==
                        data[index]['name'],
                data: data[index],
                onCallback: () {
                  context.read<ProductSearchController>().selecetedMenuItem =
                      data[index]['name'];
                  context.read<ProductSearchController>().dataList =
                      data[index]['options'];
                  context.read<ProductSearchController>().categoryIndex = index;
                  log('[DATA]${data[index]['options']}');
                },
              );
            }),
          ),
          InkWell(
            onTap: () {
              NavigationService.navigate(
                context,
                ProductListingView.routeName,
                arguments: {'title': 'On Sale', 'type': ListingType.other},
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(
                  left: 12, right: 12, top: 15, bottom: 15),
              child: Text(
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
