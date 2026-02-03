import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AppBarType, BlurDialogBody, DefaultBackButton, LuhkuAppBar;

import '../../widgets/account/edit_card.dart';
import '../../widgets/account/update_password.dart';

class AccountSecurityPage extends StatelessWidget {
  const AccountSecurityPage({super.key});
  static const routeName = 'security';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        backAction: const DefaultBackButton(),
        color: Theme.of(context).colorScheme.onPrimary,
        enableShadow: true,
        title: Text(
          "Account Security",
          style: TextStyle(
            color: Theme.of(context).colorScheme.scrim,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        height: 90,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: ListView(
          children: [
            EditCard(
              title: 'Change Password',
              onTap: () {
                changePassword(context);
              },
            ),
            EditCard(
              title: 'Delete Account',
              onTap: () {},
            )
          ],
        ),
      ),
    );
  }

  void changePassword(BuildContext context) {
    showDialog(
        context: context,
        builder: (ctx) {
          return const BlurDialogBody(
              bottomDistance: 80,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: UpdatePassword(),
              ));
        });
  }
}
