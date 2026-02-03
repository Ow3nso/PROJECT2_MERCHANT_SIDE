import 'package:flutter/material.dart';

import '../../../../../utils/app_util.dart';

class TabTitle extends StatelessWidget {
  const TabTitle(
      {super.key,
      required this.value,
      required this.color,
      required this.fontWeight});
  final Map<String, dynamic> value;
  final Color color;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          value['image'],
          height: 20,
          width: 20,
          color: color,
          package: AppUtil.packageName,
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          value['title'],
          style: TextStyle(fontWeight: fontWeight, color: color),
        ),
      ],
    );
  }
}
