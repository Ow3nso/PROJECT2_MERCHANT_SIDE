import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show StyleColors, WatchContext;
import 'package:product_listing_pkg/src/controller/search_controller.dart';

class SearchedItems extends StatelessWidget {
  const SearchedItems({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<ProductSearchController>();
    return ListView.separated(
      separatorBuilder: (context, index) => Divider(
        color: StyleColors.lukhuDividerColor,
      ),
      shrinkWrap: true,
      itemCount: controller.searchItems.length,
      itemBuilder: (context, index) {
        var item = controller.searchItems[index];
        return ListTile(
          title: Text(
            item['name'],
            style: TextStyle(
              color: Theme.of(context).colorScheme.scrim,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Theme.of(context).colorScheme.scrim,
            size: 14,
          ),
        );
      },
    );
  }
}
