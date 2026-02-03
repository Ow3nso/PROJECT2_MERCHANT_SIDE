import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        DefaultIconBtn,
        DefaultInputField,
        DefaultTextBtn,
        LuhkuAppBar,
        ReadContext,
        StyleColors,
        WatchContext;
import 'package:product_listing_pkg/src/controller/search_controller.dart';
import 'package:product_listing_pkg/src/pages/search/widgets/people_search.dart';
import 'package:product_listing_pkg/src/pages/search/widgets/searched_items.dart';

import '../../../../utils/app_util.dart';

class SearchItemPage extends StatelessWidget {
  const SearchItemPage({super.key});
  static const routeName = 'search_item';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = context.watch<ProductSearchController>();
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: LuhkuAppBar(
          appBarType: AppBarType.other,
          title: Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.only(left: 16, top: 10),
              child: Center(
                child: DefaultInputField(
                  onChange: (value) {},
                  controller: controller.searchController,
                  prefix: Image.asset(
                    AppUtil.iconSearch,
                    package: AppUtil.packageName,
                  ),
                  hintText: 'Search',
                  textInputAction: TextInputAction.search,
                  suffixIcon: controller.isSearchEmpty
                      ? DefaultTextBtn(
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 14,
                            ),
                            child: Text(
                              'Clear',
                              style: TextStyle(
                                  color: StyleColors.lukhuBlue,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          onTap: () {
                            context
                                .read<ProductSearchController>()
                                .searchController
                                .clear();
                          },
                        )
                      : null,
                ),
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: DefaultIconBtn(
                height: 30,
                assetImage: AppUtil.closeCircleIcon,
                onTap: () {
                  Navigator.of(context).pop();
                },
                packageName: AppUtil.packageName,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 16),
              child: DefaultIconBtn(
                height: 30,
                assetImage: AppUtil.addArchiveIcon,
                onTap: () {},
                packageName: AppUtil.packageName,
              ),
            ),
          ],
          enableShadow: true,
          color: Theme.of(context).colorScheme.onPrimary,
          height: 144,
          bottom: TabBar(
              indicatorColor: StyleColors.lukhuDark,
              indicatorWeight: 4,
              labelColor: StyleColors.lukhuDark,
              labelStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
              unselectedLabelColor: StyleColors.lukhuDark,
              unselectedLabelStyle:
                  const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
              tabs: const [
                Tab(text: 'Item'),
                Tab(text: 'People'),
              ]),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: const TabBarView(children: [
            SearchedItems(),
            PeopleSearch(),
          ]),
        ),
      ),
    );
  }
}
