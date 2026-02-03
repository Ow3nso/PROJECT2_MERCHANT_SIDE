import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show CustomColors, DefaultButton, StatusCard, StyleColors;

import '../../utils/app_util.dart';

class EarnCard extends StatelessWidget {
  const EarnCard({super.key, required this.data, this.onTap});
  final Map<String, dynamic> data;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.onPrimary,
        border: Border.all(color: StyleColors.lukhuDividerColor),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 12, left: 12, right: 12),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: CircleAvatar(
                    backgroundColor: data['color'],
                    radius: 25,
                    child: Image.asset(
                      data['image'],
                      package: AppUtil.packageName,
                    ),
                  ),
                ),
                Expanded(
                    child: Text(
                  data['name'],
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.scrim,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                )),
                StatusCard(
                  type: AppUtil.getType(data),
                )
              ],
            ),
          ),
          Divider(color: StyleColors.lukhuDividerColor),
          Padding(
            padding:
                const EdgeInsets.only(top: 12, left: 12, right: 12, bottom: 12),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          data['description'],
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: StyleColors.lukhuGrey80,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                DefaultButton(
                  height: 40,
                  label: 'I\'m interested',
                  color: Theme.of(context).extension<CustomColors>()?.neutral,
                  onTap: onTap,
                  actionDissabledColor: StyleColors.lukhuDisabledButtonColor,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
