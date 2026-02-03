import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard(
      {super.key,
      required this.assetImage,
      required this.onTap,
      this.selected = false,
      required this.category});
  final String assetImage;
  final void Function() onTap;
  final bool selected;
  final String category;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: !selected
          ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                'assets/images/$assetImage',
                package: AuthConstants.pluginName,
                fit: BoxFit.cover,
              ),
            )
          : Container(
              height: 205,
              width: 156,
              decoration: BoxDecoration(
                color: AuthConstants.textErrorRed,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Stack(
                children: [
                  Center(
                    child: Text(
                      category,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Positioned(
                      top: 5,
                      right: 5,
                      child: Image.asset(
                        'assets/icons/tick_square.png',
                        package: AuthConstants.pluginName,
                      ))
                ],
              ),
            ),
    );
  }
}
