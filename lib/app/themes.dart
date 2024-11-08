import 'package:flutter/material.dart';
import 'colors.dart';

final ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: AppColors.primaryLight,
    secondary: AppColors.secondaryLight,
    surface: AppColors.surfaceLight,
    error: AppColors.errorLight,
    onPrimary: AppColors.onPrimaryLight,
    onSecondary: AppColors.onSecondaryLight,
    onSurface: AppColors.onSurfaceLight,
    onError: AppColors.onErrorLight,
    onPrimaryContainer: AppColors.shadowLight,
    onPrimaryFixed: AppColors.onPrimaryContainerLight,
    //link color
    outlineVariant: AppColors.linkColor,
    brightness: Brightness.light,
  ),
  useMaterial3: true,
);

final ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: AppColors.primaryDark,
    secondary: AppColors.secondaryDark,
    surface: AppColors.surfaceDark,
    error: AppColors.errorDark,
    onPrimary: AppColors.onPrimaryDark,
    onSecondary: AppColors.onSecondaryDark,
    onSurface: AppColors.onSurfaceDark,
    onError: AppColors.onErrorDark,
    onPrimaryContainer: AppColors.shadowDark,
    onPrimaryFixed: AppColors.onPrimaryContainerDark,
    outlineVariant: AppColors.linkColorDark,
    brightness: Brightness.dark,
  ),
  useMaterial3: true,
);
