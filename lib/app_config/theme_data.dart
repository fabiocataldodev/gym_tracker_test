import 'package:flutter/material.dart';
import 'package:gym_tracker_test/app_config/app_colors.dart';

ThemeData buildThemeData() {
  return ThemeData(
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.background,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: AppColors.primaryColor,
      ),
    ),
    scaffoldBackgroundColor: AppColors.background,
  );
}
