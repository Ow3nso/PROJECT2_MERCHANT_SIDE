import 'package:auth_plugin/src/const/auth_constants.dart';
import 'package:flutter/material.dart';

class SellerExperienceCard extends StatelessWidget {
  const SellerExperienceCard({
    super.key,
    required this.assetImage,
    required this.title,
    this.selected = false,
    this.packageName,
    required this.onTap,
    this.color,
  });
  final String title;
  final bool selected;
  final String assetImage;
  final void Function() onTap;
  final String? packageName;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: selected ? color ?? AuthConstants.activeRed : Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(8),
        onTap: onTap,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Image.asset(
                    '$assetImage.png',
                    package: packageName ?? AuthConstants.pluginName,
                  ),
                  if (selected)
                    Image.asset(
                      '${assetImage}_active.png',
                      package: packageName ?? AuthConstants.pluginName,
                    )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  title,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color:
                          selected ? Colors.white : AuthConstants.textDarkColor,
                      fontWeight: FontWeight.w600,
                      fontSize: 10),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
