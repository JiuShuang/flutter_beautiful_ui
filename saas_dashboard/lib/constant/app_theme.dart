import 'package:flutter/material.dart';
import 'package:saas_dashboard/constant/app_colors.dart';
import 'package:saas_dashboard/constant/app_constrain.dart';

class AppTheme {
  static final ThemeData darkTheme = ThemeData(
    textSelectionTheme: TextSelectionThemeData(cursorColor: Colors.black),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: AppColors.grey),
        borderRadius: BorderRadius.circular(5),
      ),
    ),

    listTileTheme: ListTileThemeData(contentPadding: EdgeInsets.zero),
    buttonTheme: ButtonThemeData(buttonColor: AppColors.secondColor),
    textButtonTheme: TextButtonThemeData(
      style: ButtonStyle(
        backgroundColor: WidgetStatePropertyAll(AppColors.secondColor),
        foregroundColor: WidgetStatePropertyAll(Colors.white),
        overlayColor: WidgetStatePropertyAll(Colors.transparent),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
          ),
        ),
        textStyle: WidgetStatePropertyAll(
          TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.normal,
            fontSize: ThemeData.light().textTheme.bodySmall?.fontSize,
          ),
        ),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(AppConstrain.borderRadius),
        borderSide: BorderSide.none,
      ),
      contentPadding: EdgeInsets.symmetric(vertical: 13, horizontal: 5),
      fillColor: AppColors.grey,
      filled: true,
      isCollapsed: true,
      hintStyle: TextStyle(
        fontSize: ThemeData.light().textTheme.bodyMedium?.fontSize,
        color: Color.fromARGB(255, 102, 102, 108),
      ),
    ),
  );
}
