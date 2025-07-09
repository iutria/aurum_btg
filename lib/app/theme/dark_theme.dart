import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData darkTheme = ThemeData(
  useMaterial3: false,
  primaryColor: AppColors.primary,
  primaryColorLight: AppColors.primary,
  scaffoldBackgroundColor: AppColors.black,
  fontFamily: 'Ubuntu',
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.secondaryWhite,
    iconTheme: IconThemeData(color: AppColors.grey),
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: AppColors.white),
    labelLarge: TextStyle(color: AppColors.white),
    labelSmall: TextStyle(color: AppColors.white),
    labelMedium: TextStyle(color: AppColors.white),
    bodyLarge: TextStyle(color: AppColors.white),
    bodySmall: TextStyle(color: AppColors.white),
    displayLarge: TextStyle(color: AppColors.white),
    displayMedium: TextStyle(color: AppColors.white),
    displaySmall: TextStyle(color: AppColors.white),
    headlineLarge: TextStyle(color: AppColors.white),
    headlineMedium: TextStyle(color: AppColors.white),
    headlineSmall: TextStyle(color: AppColors.white),
    titleLarge: TextStyle(color: AppColors.white),
    titleMedium: TextStyle(color: AppColors.white),
    titleSmall: TextStyle(color: AppColors.white),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(textStyle: TextStyle(color: AppColors.primary)),
  ),
);
