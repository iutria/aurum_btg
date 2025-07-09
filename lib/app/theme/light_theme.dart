import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData lightTheme = ThemeData(
  useMaterial3: false,
  primaryColor: AppColors.primary,
  primaryColorLight: AppColors.primary,
  scaffoldBackgroundColor: AppColors.white,
  fontFamily: 'Ubuntu',
  appBarTheme: AppBarTheme(
    backgroundColor: AppColors.secondaryWhite,
    iconTheme: IconThemeData(color: AppColors.grey),
    elevation: 0,
  ),
  textTheme: TextTheme(
    bodyMedium: TextStyle(color: AppColors.black),
    labelLarge: TextStyle(color: AppColors.black),
    labelSmall: TextStyle(color: AppColors.black),
    labelMedium: TextStyle(color: AppColors.black),
    bodyLarge: TextStyle(color: AppColors.black),
    bodySmall: TextStyle(color: AppColors.black),
    displayLarge: TextStyle(color: AppColors.black),
    displayMedium: TextStyle(color: AppColors.black),
    displaySmall: TextStyle(color: AppColors.black),
    headlineLarge: TextStyle(color: AppColors.black),
    headlineMedium: TextStyle(color: AppColors.black),
    headlineSmall: TextStyle(color: AppColors.black),
    titleLarge: TextStyle(color: AppColors.black),
    titleMedium: TextStyle(color: AppColors.black),
    titleSmall: TextStyle(color: AppColors.black),
  ),
  textButtonTheme: TextButtonThemeData(
    style: TextButton.styleFrom(textStyle: TextStyle(color: AppColors.primary)),
  ),
);
