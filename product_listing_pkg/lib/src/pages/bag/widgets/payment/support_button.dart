import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show StyleColors;

import '../../../../../utils/app_util.dart';

class SupportButton extends StatelessWidget {
  const SupportButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: StyleColors.lukhuWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        contentPadding: EdgeInsets.zero,
        minVerticalPadding: 0,
        leading: CircleAvatar(
          backgroundColor: StyleColors.lukhuBlue0,
          child: Image.asset(
            AppUtil.messageQuestionIcon,
            package: AppUtil.packageName,
          ),
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: StyleColors.greyWeak1,
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Trouble With Your Order?',
              style: TextStyle(
                color: StyleColors.lukhuDark1,
                fontWeight: FontWeight.w600,
                fontSize: 12,
              ),
            ),
            Text(
              'Let our Support Team know!',
              style: TextStyle(
                color: StyleColors.greyWeak1,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              ),
            )
          ],
        ),
      ),
    );
  }
}
