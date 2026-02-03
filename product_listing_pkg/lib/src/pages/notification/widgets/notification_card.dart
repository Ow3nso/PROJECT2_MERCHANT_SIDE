import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart' show DefaultButton, StyleColors;
import 'package:product_listing_pkg/src/widgets/product_image_holder.dart';


class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
          color: StyleColors.lukhuWhite,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: StyleColors.lukhuDividerColor)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImageHolder(
            allowNavigation: false,
            imageUrl: data['image'],
            height: 296,
            fit: BoxFit.cover,
            width: size.width,
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            data['title'],
            style: TextStyle(
              color: StyleColors.lukhuDark1,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
          Text(
            data['description'],
            style: TextStyle(
              color: StyleColors.lukhuDark1,
              fontWeight: FontWeight.w400,
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 24,
          ),
          DefaultButton(
            onTap: () {
            },
            color: StyleColors.lukhuBlue,
            label: 'Shop Now',
            height: 40,
            width: size.width,
            style: TextStyle(
                color: StyleColors.lukhuWhite,
                fontWeight: FontWeight.w600,
                fontSize: 16),
          ),
        ],
      ),
    );
  }
}
