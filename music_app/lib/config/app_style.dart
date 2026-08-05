import 'package:flutter/material.dart';

class AppColors {
  static final Color textColor = Colors.white;
  static final Color labelTextColor = Colors.white.withOpacity(0.64);
  static final Color btnColor = Color(0xff212121);
  static final Color borderColor = Color(0xff818181);
  static final Color red=Color(0xffDF3131);
}

class AppLayout {
  static final double paddingSmall = 8;
  static final double paddingMedium = 16;
  static final double paddingLarge = 24;
  static final double borderRadius = 16;
}

class AppTextStyle {
  static final TextStyle h1 = TextStyle(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.textColor);
  static final TextStyle h2 = TextStyle(
      fontSize: 22, fontWeight: FontWeight.bold, color: AppColors.textColor);
  static final TextStyle h3 = TextStyle(
      fontSize: 20, fontWeight: FontWeight.bold, color: AppColors.textColor);
  static final TextStyle labelLarge =
      TextStyle(fontSize: 14, color: AppColors.labelTextColor);
  static final TextStyle labelMedium =
      TextStyle(fontSize: 12, color: AppColors.labelTextColor);
  static final TextStyle bodyModium =
      TextStyle(fontSize: 16, color: AppColors.textColor);
}
