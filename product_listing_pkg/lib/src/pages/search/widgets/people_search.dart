import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show WatchContext, StyleColors;

import '../../../controller/search_controller.dart';

class PeopleSearch extends StatelessWidget {
  const PeopleSearch({super.key});

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
        var item = controller.searchPeople[index];
        return ListTile(
          leading: CircleAvatar(
            backgroundColor: StyleColors.pink,
            backgroundImage: NetworkImage(item['image']),
          ),
          title: Text(
            item['name'],
            style: TextStyle(
              color: Theme.of(context).colorScheme.scrim,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: Text(
            '${item['link']}',
            style: TextStyle(
              color: StyleColors.lukhuGrey70,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        );
      },
    );
  }
}
