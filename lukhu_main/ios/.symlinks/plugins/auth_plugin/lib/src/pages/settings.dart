import 'package:auth_plugin/src/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        AppBarType,
        BlurDialogBody,
        DefaultBackButton,
        GlobalAppUtil,
        LuhkuAppBar,
        NavigationService,
        ReadContext,
        StyleColors,
        WatchContext;

import '../../auth_plugin.dart';
import '../controllers/settings/user_notification_controller.dart';
import '../utils/app_util.dart';
import '../widgets/settings/confirm_notification.dart';
import '../widgets/settings/setting_tile.dart';
import 'account/account_security.dart';
import 'delivery_address.dart';

class AccountSettingsPage extends StatelessWidget {
  const AccountSettingsPage({super.key});
  static const routeName = 'user_settings';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //DeviceInfoPlugin devicePlugin = DeviceInfoPlugin();
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        backAction: const DefaultBackButton(),
        enableShadow: true,
        height: 50,
        title: Text(
          'Settings',
          style: TextStyle(
            color: Theme.of(context).colorScheme.scrim,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      'General',
                      style: TextStyle(
                        color: StyleColors.pink,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SettingTile(
                    onTap: () {
                      NavigationService.navigate(
                          context, DeliveryAddressPage.routeName);
                    },
                    image: AppUtil.location,
                    packageName: GlobalAppUtil.productListingPackageName,
                    title: 'Delivery Address',
                    subTitle: 'Add or Edit your addresses',
                  ),
                  SettingTile(
                    onTap: () {
                      NavigationService.navigate(
                          context, AccountSecurityPage.routeName);
                    },
                    image: AppUtil.accountSecurityIcon,
                    packageName: AppUtil.packageName,
                    title: 'Account Security',
                    subTitle: 'Manage your Lukhu account with ease',
                  ),
                  SettingTile(
                    onTap: () {
                      context
                          .read<UserNotificationController>()
                          .initPermission();
                      show(context);
                    },
                    image: AppUtil.notificationIcon,
                    packageName: AppUtil.packageName,
                    title: 'Notifications',
                    subTitle: 'For daily updates, offers and campaigns',
                  ),
                ],
              ),
            ),
            Divider(
              color: StyleColors.lukhuDividerColor,
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      'Support',
                      style: TextStyle(
                        color: StyleColors.pink,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SettingTile(
                    onTap: () {},
                    image: AppUtil.helpIcon,
                    packageName: AppUtil.packageName,
                    title: 'Help Centre',
                    subTitle: 'Get answers to all your questions',
                  ),
                  SettingTile(
                    onTap: () {
                      Helpers.launchInBrowser(Uri.parse('tel:0746553470'));
                    },
                    image: AppUtil.supportIcon,
                    packageName: AppUtil.packageName,
                    title: 'Contact Support',
                    subTitle: 'Need help? Let us know',
                  ),
                ],
              ),
            ),
            Divider(
              color: StyleColors.lukhuDividerColor,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Text(
                      'More',
                      style: TextStyle(
                        color: StyleColors.pink,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SettingTile(
                    onTap: () {},
                    image: AppUtil.versionIcon,
                    packageName: AppUtil.packageName,
                    title: 'Version',
                    subTitle:
                        context.read<UserRepository>().packageInfo?.version ??
                            '_._._',
                  ),
                  SettingTile(
                    onTap: () {},
                    image: AppUtil.rateIcon,
                    packageName: AppUtil.packageName,
                    title: 'Rate Us',
                    subTitle: 'Let us know what you think of us',
                  ),
                  SettingTile(
                    onTap: () {
                      Helpers.launchInBrowser(Uri.parse(AppUtil.officialSite));
                    },
                    image: AppUtil.aboutIcon,
                    packageName: AppUtil.packageName,
                    title: 'About Lukhu',
                    subTitle: 'Learn more about who we are',
                  ),
                  SettingTile(
                    onTap: () {
                      if (context.read<UserRepository>().userAuthenticated) {
                        context.read<UserRepository>().signOut();
                        NavigationService.navigate(context, AuthGenesisPage.routeName, forever: true);
                      } else {
                        NavigationService.navigate(
                            context, AuthGenesisPage.routeName,
                            forever: true);
                      }
                    },
                    image: AppUtil.logoutIcon,
                    packageName: AppUtil.packageName,
                    title: 'Log Out',
                    subTitle: 'Pleeaassee... don\'t leave me',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void show(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return BlurDialogBody(
            bottomDistance: 80,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ConfirmNotification(
                onTap: (value) {
                  context.read<UserNotificationController>().grantPermission();
                  Navigator.of(context).pop();
                },
                value: context
                    .watch<UserNotificationController>()
                    .allowNotification,
                onChanged: (value) {
                  context.read<UserNotificationController>().allowNotification =
                      value ?? false;
                },
              ),
            ),
          );
        });
  }
}
