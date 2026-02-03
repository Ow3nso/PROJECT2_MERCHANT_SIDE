import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryColor = Color(0xFF0D47A1);
  static const Color secondaryColor = Color(0xFF1565C0);
  static const Color primaryTextColor = Colors.black;
  static const Color secondaryTextColor = Colors.white;
  static const Color dividerColor = Color(0xFFBDBDBD);
}

class AppTextStyles {
  static const TextStyle title = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: AppColors.primaryTextColor,
  );

  static const TextStyle body = TextStyle(
    fontSize: 16,
    color: AppColors.primaryTextColor,
    height: 1.5,
  );

  static const TextStyle bodyBold = TextStyle(
    fontSize: 16,
    color: AppColors.secondaryTextColor,
    height: 1.5,
    fontWeight: FontWeight.w600,
  );
}

class AppSizes {
  static const double padding = 16.0;
  static const double borderRadius = 8.0;
  static const double buttonHeight = 50.0;
  static const double buttonRadius = 25.0;
  static const double sizedBoxHeight = 16.0;
}
