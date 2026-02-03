import 'package:auth_plugin/src/controllers/auth/user_item_controller.dart';
import 'package:auth_plugin/src/pages/settings.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        CartIcon,
        LuhkuAppBar,
        NavigationService,
        ProductListingView,
        ReadContext,
        StyleColors,
        WatchContext;

import '../../../auth_plugin.dart';
import '../../controllers/auth/account_controller.dart';
import '../../widgets/account/account_option.dart';
import '../../widgets/account/welcome_card.dart';
import '../../widgets/product/user_item_container.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  static const routeName = 'account_page';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var controller = context.read<AccountController>();

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: LuhkuAppBar(
          appBarType: AppBarType.other,
          backAction: Expanded(
            child: Padding(
              padding: const EdgeInsets.only(top: 27, bottom: 14, left: 16),
              child: Text(
                'Hi, ${context.watch<UserRepository>().user?.firstName ?? ""}',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.scrim,
                  fontSize: 18,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
          actions: [
            const Padding(
              padding: EdgeInsets.only(right: 16),
              child: DefaultCallBtn(),
            ),
            IconButton(
              icon: Icon(
                Icons.settings_outlined,
                color: Theme.of(context).colorScheme.scrim,
              ),
              onPressed: () {
                NavigationService.navigate(
                  context,
                  AccountSettingsPage.routeName,
                );
              },
            ),
            const CartIcon()
          ],
          color: Theme.of(context).colorScheme.onPrimary,
          enableShadow: true,
        ),
        body: SizedBox(
          width: size.width,
          height: size.height,
          child: ListView(
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 16, left: 16, right: 16),
                child: WelcomeCard(),
              ),
              Row(
                children:
                    List.generate(controller.accountOptions.length, (index) {
                  var option = controller.accountOptions[index];
                  return Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: AccountOption(
                        data: option,
                        onTap: () {
                          if (option['route'] != '') {
                            NavigationService.navigate(
                                context, option['route']);
                          }
                        },
                      ),
                    ),
                  );
                }),
              ),
              Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.onPrimary,
                    ),
                    child: TabBar(
                        indicatorColor: StyleColors.lukhuDark,
                        indicatorWeight: 4,
                        labelColor: StyleColors.lukhuDark,
                        labelStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w700),
                        unselectedLabelColor: StyleColors.lukhuDark,
                        unselectedLabelStyle: const TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        tabs: const [
                          Tab(text: 'Recently Viewed'),
                          Tab(text: 'Items Loved'),
                        ]),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: SizedBox(
                      height: 170,
                      width: size.width,
                      child: TabBarView(
                        children: [
                          UserItemContainer(
                            onTap: () {
                              NavigationService.navigate(
                                  context, ProductListingView.routeName,
                                  arguments: {'title': 'Recently Viewed'});
                            },
                            products:
                                context.read<UserItemController>().products,
                          ),
                          UserItemContainer(
                            onTap: () {
                              NavigationService.navigate(
                                  context, ProductListingView.routeName,
                                  arguments: {'title': 'Items Loved'});
                            },
                            products:
                                context.read<UserItemController>().products,
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  bool userAuthenticated(BuildContext context) =>
      context.watch<UserRepository>().userAuthenticated;
}
