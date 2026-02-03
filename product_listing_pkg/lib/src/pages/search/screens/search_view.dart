import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show NavigationService, ReadContext, StyleColors, WatchContext;
import 'package:product_listing_pkg/src/pages/search/widgets/new_product.dart';

import '../../../../utils/app_util.dart';
import '../../../controller/search_controller.dart';
import '../../product/pages/product_listing_view.dart';
import '../widgets/search_menu.dart';
import '../widgets/search_tile.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<ProductSearchController>();
    var list = controller.searchCategory[index]['data'];
    return Row(
      children: [
        SearchMenu(
          data: list,
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 9, bottom: 10),
                  child: Container(
                    height: 100,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: StyleColors.lukhuWarning),
                    child: Text(
                      'Marketing Banner',
                      style: TextStyle(
                          color: StyleColors.lukhuDark,
                          fontWeight: FontWeight.w600,
                          fontSize: 12),
                    ),
                  ),
                ),
                context.watch<ProductSearchController>().categoryIndex == 0
                    ? NewProduct(
                        data: list
                            .where((value) => value['name'] != 'New In')
                            .toList(),
                      )
                    : ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, i) {
                          var data =
                              context.read<ProductSearchController>().dataList[i];
                          return SearchTile(
                            data: data,
                            onTap: () {
                              NavigationService.navigate(
                                context,
                                ProductListingView.routeName,
                                arguments: {
                                  'title': data,
                                  'type': ListingType.other
                                },
                              );
                            },
                          );
                        },
                        itemCount:
                            context.watch<ProductSearchController>().dataList.length,
                      )
              ],
            ),
          ),
        )
      ],
    );
  }
}
