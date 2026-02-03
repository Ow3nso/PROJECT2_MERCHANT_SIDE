import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        CustomColors,
        DefaultButton,
        NavigationService,
        ProfileCard,
        StyleColors,
        ViewTitleType,
        WatchContext;

import '../../controllers/auth/account_controller.dart';
import '../../pages/account/edit_account.dart';
import '../../utils/app_util.dart';
import 'stat_data.dart';

import '../../../auth_plugin.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = context.watch<AccountController>();
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: ProfileCard(
              store: 'converse_png',
              radius: 32,
              location: 'Lavington',
              type: ViewTitleType.verified,
              user: context.watch<UserRepository>().user?.firstName ?? '',
              image: context.watch<UserRepository>().user?.imageUrl ??
                  AppUtil.errorAvatar,
              onTap: () {},
              trailing: DefaultButton(
                label: 'Edit Profile',
                color: Theme.of(context).extension<CustomColors>()?.neutral,
                onTap: () {
                  NavigationService.navigate(
                      context, EditAccountPage.routeName);
                },
                width: 120,
                height: 30,
              ),
            ),
          ),
          Divider(
            color: StyleColors.lukhuDividerColor,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 3),
            child: Row(
              children: List.generate(
                controller.stats.length,
                (index) {
                  var stat = controller.stats[index];
                  return Expanded(child: StatData(stat: stat));
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
