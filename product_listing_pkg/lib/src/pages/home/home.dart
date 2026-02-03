import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show AppBarType, LuhkuAppBar, StyleColors;
import 'package:product_listing_pkg/src/pages/home/screens/discover_view.dart';
import 'screens/for_you_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static const routeName = 'home_page';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child:  Scaffold(
        appBar: LuhkuAppBar(
          appBarType: AppBarType.home,
          color: Theme.of(context).colorScheme.onPrimary,
          enableShadow: true,
          bottomHeight: kTextTabBarHeight,
          bottom: TabBar(
           indicatorColor: StyleColors.lukhuDark,
            labelColor: StyleColors.lukhuDark,
            labelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700
            ),
            unselectedLabelColor: StyleColors.lukhuDark,
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400
            ),
            tabs: const [
            Tab(text: 'For You',),
            Tab(
              text: 'Discover',
            ),
          ]),
        ),
        body: const TabBarView(children: [ForYouView(),DiscoverView()]),
      ),
    );
  }
}
