import 'package:flutter/material.dart';
import 'package:untitled/src/styles/AppFontsStyles.dart';

import '../Colors.dart';

class AppTextTheme {
  static TextTheme darkTextTheme() => TextTheme(
    // Display Styles
    displayLarge: AppFontsStyles.displayLarge(AppColors.kprimary300),
    displayMedium: AppFontsStyles.displayMedium(AppColors.kprimary300),
    displaySmall: AppFontsStyles.displaySmall(AppColors.kprimary300),

    // Headline Styles
    headlineLarge: AppFontsStyles.headlineLarge(AppColors.kprimary300),
    headlineMedium: AppFontsStyles.headlineMedium(AppColors.kprimary300),
    headlineSmall: AppFontsStyles.headlineSmall(AppColors.kprimary300),

    // Title Styles
    titleLarge: AppFontsStyles.titleLarge(AppColors.kprimary300),
    titleMedium: AppFontsStyles.titleMedium(AppColors.kprimary300),
    titleSmall: AppFontsStyles.titleSmall(AppColors.kprimary300),

    // Body Styles
    bodyLarge: AppFontsStyles.bodyLarge(AppColors.kprimary300),
    bodyMedium: AppFontsStyles.bodyMedium(AppColors.kprimary300),
    bodySmall: AppFontsStyles.bodySmall(AppColors.kprimary300),

    // Label Styles
    labelLarge: AppFontsStyles.labelLarge(AppColors.kprimary300),
    labelMedium: AppFontsStyles.labelMedium(AppColors.kprimary300),
    labelSmall: AppFontsStyles.labelSmall(AppColors.kprimary300),


    // Other styles (caption, button, overline) can be added here

  );

  static TextTheme lightTextTheme() => TextTheme(
  // Display Styles
  displayLarge: AppFontsStyles.displayLarge(AppColors.ksecondary300),
  displayMedium: AppFontsStyles.displayMedium(AppColors.ksecondary300),
  displaySmall: AppFontsStyles.displaySmall(AppColors.ksecondary300),

  // Headline Styles
  headlineLarge: AppFontsStyles.headlineLarge(AppColors.ksecondary300),
  headlineMedium: AppFontsStyles.headlineMedium(AppColors.ksecondary300),
  headlineSmall: AppFontsStyles.headlineSmall(AppColors.ksecondary300),

  // Title Styles
  titleLarge: AppFontsStyles.titleLarge(AppColors.ksecondary300),
  titleMedium: AppFontsStyles.titleMedium(AppColors.ksecondary300),
  titleSmall: AppFontsStyles.titleSmall(AppColors.ksecondary300),

  // Body Styles
  bodyLarge: AppFontsStyles.bodyLarge(AppColors.ksecondary300),
  bodyMedium: AppFontsStyles.bodyMedium(AppColors.ksecondary300),
  bodySmall: AppFontsStyles.bodySmall(AppColors.ksecondary300),

  // Label Styles
  labelLarge: AppFontsStyles.labelLarge(AppColors.ksecondary300),
  labelMedium: AppFontsStyles.labelMedium(AppColors.ksecondary300),
  labelSmall: AppFontsStyles.labelSmall(AppColors.ksecondary300),
  );

}