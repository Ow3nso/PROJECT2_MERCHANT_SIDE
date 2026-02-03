import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
    AppBarType,
    CustomColors,
    DefaultBackButton,
    LuhkuAppBar,
    NavigationService,
    ReadContext;
import 'package:lukhu_pay/util/app_util.dart';

import '../../lukhu_pay.dart';
import '../widgets/transactions/transactions_container.dart';
// import 'package:navigation_controller_pkg/src/utils/const/constants.dart';
import 'package:navigation_controller_pkg/navigation_controller_pkg.dart';
// import 'package:navigation_controller_pkg/src/navigation_scaffold/widgets/bottom_navigation.dart';

class WalletPage extends StatefulWidget {
  const WalletPage({super.key});
  static const routeName = 'wallet';

  @override
  _WalletPageState createState() => _WalletPageState();
}

class _WalletPageState extends State<WalletPage> {
  @override
  void initState() {
    super.initState();
    _refreshData();
  }

  Future<void> _refreshData() async {
    await context.read<TransactionController>().getTransactions(isRefreshMode: true);
  }

  @override
  Widget build(BuildContext context) {
    // var size = MediaQuery.of(context).size;
    var args = ModalRoute.of(context)!.settings.arguments;
    final showButton = args != null;
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        backAction: showButton
            ? DefaultBackButton(
          assetIcon: AppUtil.backButtonIcon,
          packageName: AppUtil.packageName,
        )
            : null,
        color: Theme.of(context).extension<CustomColors>()?.neutral,
        title: Text(
          'Your Wallet',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onPrimary,
            ),
            onPressed: () {
              /// Navigating to the PaySettingsPage.
              NavigationService.navigate(context, PaySettingsPage.routeName);
            },
          )
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      body: Column(
        children: [
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshData,
              child: ListView(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).extension<CustomColors>()?.neutral,
                    ),
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Column(
                      children: [
                        const BalanceCard(
                          userId: '',
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 24, bottom: 21),
                          child: Row(
                            children: List.generate(AppUtil.walletOptions.length, (index) {
                              var option = AppUtil.walletOptions[index];
                              return Expanded(
                                child: WalletOption(
                                  option: option,
                                  onTap: () {
                                    NavigationService.navigate(
                                      context,
                                      option['route'],
                                    );
                                  },
                                ),
                              );
                            }),
                          ),
                        )
                      ],
                    ),
                  ),
                  const TransactionsContainer(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
