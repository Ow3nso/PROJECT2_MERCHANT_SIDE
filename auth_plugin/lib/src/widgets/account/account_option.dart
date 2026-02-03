import 'package:auth_plugin/src/utils/app_util.dart';
import 'package:flutter/material.dart';

class AccountOption extends StatelessWidget {
  const AccountOption({
    super.key,
    required this.data,
    this.onTap,
  });
  final Map<String, dynamic> data;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  color: Theme.of(context).colorScheme.scrim,
                ),
              ),
              child: Image.asset(
                data['image'],
                package: AppUtil.packageName,
              ),
            ),
          ),
        ),
        Text(
          data['name'],
          style: TextStyle(
            color: Theme.of(context).colorScheme.scrim,
            fontWeight: FontWeight.w600,
            fontSize: 12,
          ),
        ),
      ],
    );
  }
}
