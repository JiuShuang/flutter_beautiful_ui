import 'package:flutter/material.dart';

class AppColor {
  static final Color textColor = Colors.white;
  static final Color hintTextColor = Color(0xffF7FEFF).withOpacity(0.65);

  static final Color containerColor = Color(0xffF7FEFF).withOpacity(0.05);
  static final Color bgColorFirst = Color(0xff0C1013);
  static final Color bgColorSecond = Color(0xff112331);
}

class AppLayout {
  static final double borderRadius = 10;
  static final double paddingSmall = 10;
  static final double paddingMedium = 15;
  static final double paddingLarge = 20;
  static final double borderWidth = 2;
}

class AppTextStyle {
  static final TextStyle h1 = TextStyle(
    fontSize: 23,
    fontWeight: FontWeight.bold,
    color: AppColor.textColor,
  );

  static final TextStyle h2 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
    color: AppColor.textColor,
  );

  static final TextStyle h3 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AppColor.textColor,
  );

  static final TextStyle bodyMedium = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: AppColor.textColor,
  );

  static final TextStyle bodySmall = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: AppColor.textColor,
  );

  static final TextStyle captionMedium = TextStyle(
    fontSize: 14,
    color: AppColor.hintTextColor,
  );

  static final TextStyle captionSmall = TextStyle(
    fontSize: 12,
    color: AppColor.hintTextColor,
  );
}
