import 'package:flutter/material.dart';
import 'package:lukhu_packages_pkg/lukhu_packages_pkg.dart'
    show DefaultButton, StyleColors;

import '../../../utils/app_util.dart';

class ConfirmationCard extends StatelessWidget {
  const ConfirmationCard({
    super.key,
    required this.title,
    required this.description,
    required this.height,
    required this.primaryLabel,
    required this.secondaryLabel,
    this.onPrimaryTap,
    this.onSecondaryTap,
    this.assetImage,
    this.packageName,
    this.color,
    this.primaryButtonColor,
    this.primaryLoading = false,
    this.secondaryLoading = false,
    this.child,
    this.colorShadeSecond,
    this.descriptionChild,
  });

  final String title;
  final String description;
  final double height;
  final String primaryLabel;
  final String secondaryLabel;
  final Function()? onPrimaryTap;
  final void Function()? onSecondaryTap;
  final String? assetImage;
  final String? packageName;
  final Color? color;
  final Color? primaryButtonColor;
  final bool primaryLoading;
  final bool secondaryLoading;
  final Widget? child;
  final Color? colorShadeSecond;
  final Widget? descriptionChild;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Container(
      height: height,
      width: size.width,
      padding: const EdgeInsets.only(top: 20, left: 16, right: 16, bottom: 16),
      decoration: BoxDecoration(
        color: StyleColors.lukhuWhite,
        border: Border.all(color: StyleColors.lukhuDividerColor),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: color ?? StyleColors.shadeColor1,
            radius: 24,
            child: CircleAvatar(
              radius: 18,
              backgroundColor: colorShadeSecond ?? StyleColors.shadeColor2,
              child: Image.asset(
                assetImage ?? AppUtil.iconCircleCheck,
                package: packageName ?? AppUtil.packageName,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: StyleColors.lukhuDark1,
                fontWeight: FontWeight.w600,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(child: child),
          if (description.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Text(
                description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: StyleColors.lukhuGrey80,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          SizedBox(child: descriptionChild),
          Padding(
            padding: const EdgeInsets.only(top: 24),
            child: DefaultButton(
              loading: primaryLoading,
              onTap: onPrimaryTap,
              color: primaryButtonColor ?? StyleColors.lukhuBlue,
              actionDissabledColor: StyleColors.lukhuDisabledButtonColor,
              label: primaryLabel,
              height: 40,
              width: size.width - 32,
            ),
          ),
          if (secondaryLabel.isNotEmpty)
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: DefaultButton(
                loading: secondaryLoading,
                onTap: onSecondaryTap,
                label: secondaryLabel,
                color: StyleColors.lukhuWhite,
                height: 40,
                width: size.width - 32,
                boarderColor: StyleColors.lukhuDividerColor,
                textColor: StyleColors.lukhuDark1,
              ),
            ),
        ],
      ),
    );
  }
}
