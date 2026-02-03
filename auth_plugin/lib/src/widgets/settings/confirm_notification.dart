import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show
        CustomColors,
        DefaultButton,
        DefaultSwitch,
        ReadContext,
        StyleColors,
        WatchContext;

import '../../controllers/settings/user_notification_controller.dart';

class ConfirmNotification extends StatelessWidget {
  const ConfirmNotification(
      {super.key, this.value = false, required this.onChanged, this.onTap});
  final bool value;
  final void Function(bool?) onChanged;
  final void Function(bool)? onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        border: Border.all(
          color: StyleColors.lukhuDividerColor,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text('Notifications',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Theme.of(context).colorScheme.scrim,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              )),
          Padding(
            padding: const EdgeInsets.only(bottom: 16, top: 8),
            child: Text(
                'Turn on Notifications to receive communication on orders, campaigns, offers and much more. It\'s worth it!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: StyleColors.lukhuGrey80,
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                )),
          ),
          Divider(
            color: StyleColors.lukhuDividerColor,
          ),
          DefaultSwitch(
            activeColor: Theme.of(context).extension<CustomColors>()?.neutral,
            checkedColor: StyleColors.lukhuBlue70,
            value:
                context.watch<UserNotificationController>().allowNotification,
            onChanged: (value) {
              context.read<UserNotificationController>().allowNotification =
                  value ?? false;
            },
          ),
          Divider(
            color: StyleColors.lukhuDividerColor,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 8, top: 8),
            child: DefaultButton(
              label: 'Confirm',
              onTap: () => onTap!(value),
              width: size.width - 32,
              height: 40,
              color: Theme.of(context).extension<CustomColors>()?.neutral,
            ),
          ),
          DefaultButton(
            label: 'Cancel',
            onTap: () {
              Navigator.of(context).pop(true);
            },
            width: size.width - 32,
            height: 40,
            textColor: Theme.of(context).colorScheme.scrim,
            boarderColor: StyleColors.lukhuDividerColor,
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ],
      ),
    );
  }
}
