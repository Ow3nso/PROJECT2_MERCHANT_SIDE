import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show StyleColors;
import '../../../../utils/app_util.dart';

class StoreStatsCard extends StatelessWidget {
  const StoreStatsCard(
      {super.key, this.child, required this.title, required this.description});
  final Widget? child;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 92,
      //height: 42,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
          color: StyleColors.lukhuBlue0,
          borderRadius: BorderRadius.circular(2)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                description,
                style: TextStyle(
                    color: StyleColors.lukhuDark1,
                    fontWeight: FontWeight.w700,
                    fontSize: 14),
              ),
              if (child != null) const SizedBox(width: 6),
              if (child != null)
                Expanded(
                  child: child!,
                )
            ],
          ),
          Text(
            title,
            style: TextStyle(
                color: StyleColors.lukhuDark1,
                fontWeight: FontWeight.w500,
                fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class StoreQuickLink extends StatelessWidget {
  const StoreQuickLink({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Image.asset(
          data['image'],
          package: AppUtil.packageName,
          height: 20,
          width: 20,
        ),
        const SizedBox(width: 1),
        Expanded(
          child: Text(
            data['title'],
            style: TextStyle(
              fontWeight: FontWeight.w600,
              color: StyleColors.lukhuDark1,
              fontSize: 15,
            ),
          ),
        )
      ],
    );
  }
}
