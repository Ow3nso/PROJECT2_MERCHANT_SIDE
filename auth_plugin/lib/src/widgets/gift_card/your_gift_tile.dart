import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart';

import 'payment_icon.dart';

class YourGiftTile extends StatelessWidget {
  const YourGiftTile({
    super.key,
    required this.label,
    this.onTap,
    this.showIcon = true,
  });
  final String label;
  final void Function()? onTap;
  final bool showIcon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: StyleColors.lukhuDividerColor)),
      onTap: onTap,
      horizontalTitleGap: 12,
      leading: showIcon ? const PaymentIcon() : null,
      tileColor: Theme.of(context).colorScheme.onPrimary,
      title: Text(
        label,
        style: TextStyle(
            color: Theme.of(context).colorScheme.scrim,
            fontWeight: FontWeight.w600,
            fontSize: 14),
      ),
      trailing: Icon(Icons.arrow_forward_ios,
          size: 15, color: Theme.of(context).colorScheme.scrim),
    );
  }
}
