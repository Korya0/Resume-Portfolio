import 'package:flutter/material.dart';
import 'package:my_career/core/theme/colors/app_colors.dart';
import 'package:my_career/core/theme/typography/app_text_styles.dart';
import 'package:my_career/core/theme/typography/app_text_theme_extension.dart';

class AppTheme {
  AppTheme._();

  // Dark Theme integrating our custom extensions
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.myCareerBackground,
      colorScheme: ColorScheme.dark(
        surface: AppColors.myCareerSurface,
        primary: AppColors.myCareerAccent,
        secondary: AppColors.myCareerAccent2,
        error: AppColors.myCareerError,
      ),
      extensions: <ThemeExtension<dynamic>>[
        AppColors.darkColorsExtension,
        AppTextThemeExtension(
          displayLarge: AppTextStyles.h1.copyWith(
            color: AppColors.myCareerText,
          ),
          titleMedium: AppTextStyles.h2.copyWith(color: AppColors.myCareerText),
          bodyRegular: AppTextStyles.body.copyWith(
            color: AppColors.myCareerText,
          ),
          labelMono: AppTextStyles.labelMono.copyWith(
            color: AppColors.myCareerAccent,
          ),
          codeMono: AppTextStyles.codeMono.copyWith(
            color: AppColors.myCareerMuted,
          ),
        ),
      ],
      // Override default components minimally
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.myCareerBackground,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }
}
