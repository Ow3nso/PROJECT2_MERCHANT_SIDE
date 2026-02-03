import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show StyleColors, InfoCardType;

class InfoCard extends StatelessWidget {
  const InfoCard(
      {super.key,
      required this.data,
      this.showBottomBorder = false,
      this.type = InfoCardType.add,
      this.onTap});

  final Map<String, dynamic> data;
  final bool showBottomBorder;
  final InfoCardType type;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: showBottomBorder
                  ? StyleColors.lukhuDividerColor
                  : StyleColors.lukhuWhite,
            ),
            top: BorderSide(
              color: StyleColors.lukhuDividerColor,
            ),
          ),
        ),
        child: Row(children: [
          Text(data['name'],
              style: TextStyle(
                color: StyleColors.lukhuDark1,
                fontWeight: FontWeight.w500,
              )),
          const Spacer(),
          Text(data['value'],
              style: TextStyle(
                color: StyleColors.lukhuGrey80,
                fontWeight: FontWeight.w400,
                fontSize: 12,
              )),
          if (type == InfoCardType.add)
            const SizedBox(
              width: 8,
            ),
          if (type != InfoCardType.edit)
            Icon(
              Icons.arrow_forward_ios,
              color: StyleColors.lukhuDark1,
              size: 16,
            )
        ]),
      ),
    );
  }
}
