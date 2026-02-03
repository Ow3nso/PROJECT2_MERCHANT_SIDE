import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show AppBarType, DefaultBackButton, LuhkuAppBar, StyleColors;
import '../widgets/notification_card.dart';

class InfoView extends StatelessWidget {
  const InfoView({super.key});
  static const routeName = 'info_view';

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var data =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
      appBar: LuhkuAppBar(
        appBarType: AppBarType.other,
        height: 125,
        color: Theme.of(context).colorScheme.onPrimary,
        enableShadow: true,
        backAction: const DefaultBackButton(),
        bottom: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8, left: 16),
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  'Your Notification',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontSize: 24,
                    color: StyleColors.lukhuDark1,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: ListView(
            children: [
              const SizedBox(
                height: 16,
              ),
              NotificationCard(
                data: data,
              )
            ],
          ),
        ),
      ),
    );
  }
}
