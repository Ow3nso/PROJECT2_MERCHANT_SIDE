import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        CartIcon,
        DefaultButton,
        DefaultIconBtn,
        LuhkuAppBar,
        NavigationService,
        ReadContext,
        StyleColors,
        WatchContext;
import 'package:product_listing_pkg/src/controller/search_controller.dart';
import 'package:product_listing_pkg/utils/app_util.dart';

import 'screens/item_view.dart';
import 'screens/search_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});
  static const routeName = 'search_page';

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage>
    with SingleTickerProviderStateMixin {
  final pageController = PageController();

  TabController? tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = context.watch<ProductSearchController>();
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: LuhkuAppBar(
          appBarType: AppBarType.other,
          title: Expanded(
            flex: 8,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: DefaultButton(
                packageName: AppUtil.packageName,
                buttonIconType: ButtonIconType.image,
                asssetIcon: AppUtil.iconSearch,
                onTap: () {
                  NavigationService.navigate(context, SearchItemPage.routeName);
                },
                width: size.width,
                height: 35,
                label: 'Search',
                textColor: StyleColors.lukhuGrey500,
                boarderColor: StyleColors.lukhuDividerColor,
                mainAxisAlignment: MainAxisAlignment.start,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 24),
              child: DefaultIconBtn(
                height: 30,
                assetImage: AppUtil.iconHeart,
                onTap: () {},
                packageName: AppUtil.packageName,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: CartIcon(),
            )
          ],
          enableShadow: true,
          color: Theme.of(context).colorScheme.onPrimary,
          height: 133,
          bottom: TabBar(
            controller: tabController,
            onTap: (index) {
              context.read<ProductSearchController>().selecetedMenuItem =
                  controller.searchCategory[index]['data'][0]['name'];
              context.read<ProductSearchController>().categoryIndex = 0;
              pageController.animateToPage(index,
                  duration: AppUtil.animationDuration, curve: Curves.ease);
            },
            indicatorColor: StyleColors.lukhuDark,
            indicatorWeight: 4,
            labelColor: StyleColors.lukhuDark,
            labelStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
            unselectedLabelColor: StyleColors.lukhuDark,
            unselectedLabelStyle:
                const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            tabs: const [
              Tab(
                text: 'Women',
              ),
              Tab(
                text: 'Men',
              ),
              Tab(
                text: 'Unisex',
              ),
              Tab(
                text: 'Kids',
              ),
            ],
          ),
        ),
        body: SizedBox(
          height: size.height,
          width: size.width,
          child: PageView.builder(
            controller: pageController,
            onPageChanged: (index) {
              tabController?.animateTo(index);
              context.read<ProductSearchController>().categoryIndex = 0;
              context.read<ProductSearchController>().selecetedMenuItem =
                  controller.searchCategory[index]['data'][0]['name'];
            },
            itemCount: controller.searchCategory.length,
            itemBuilder: (context, index) => const SearchView(index: 0),
          ),
        ),
      ),
    );
  }
}
