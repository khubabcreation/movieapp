import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTheme {
  static final ThemeData theme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Poppins",
    appBarTheme: _getAppBarTheme(),
    textTheme: _getTextTheme(),
    scaffoldBackgroundColor: AppColors.white88,
  );

  static AppBarTheme _getAppBarTheme() {
    return const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0.0,
      shadowColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: AppColors.darkBlue,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
      actionsIconTheme: IconThemeData(
        color: AppColors.darkBlue,
        size: 24.0,
      ),
    );
  }

  static TextTheme _getTextTheme() {
    return const TextTheme(
      titleLarge: TextStyle(
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        fontSize: 16.0,
      ),
    );
  }
}
