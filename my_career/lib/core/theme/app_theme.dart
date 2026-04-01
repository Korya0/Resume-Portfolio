import 'package:flutter/material.dart';
import 'colors/app_colors.dart';
import 'typography/app_text_styles.dart';
import 'typography/app_text_theme_extension.dart';

class AppTheme {
  AppTheme._();

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: AppColors.myCareerBackground,
      colorScheme: const ColorScheme.dark(
        surface: AppColors.myCareerSurface,
        primary: AppColors.myCareerAccent,
        secondary: AppColors.myCareerAccent2,
        error: AppColors.myCareerError,
      ),
      extensions: <ThemeExtension<dynamic>>[
        AppColors.darkColorsExtension,
        AppTextThemeExtension(
          displayLarge: AppTextStyles.h1.copyWith(color: AppColors.myCareerText),
          titleMedium: AppTextStyles.h2.copyWith(color: AppColors.myCareerText),
          bodyRegular: AppTextStyles.body.copyWith(color: AppColors.myCareerText),
          labelMono: AppTextStyles.labelMono.copyWith(color: AppColors.myCareerAccent),
          codeMono: AppTextStyles.codeMono.copyWith(color: AppColors.myCareerMuted),
          font12W700Color: AppTextStyles.labelMono.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w700,
            color: AppColors.myCareerText,
          ),
          font14W400Color: AppTextStyles.body.copyWith(
            fontSize: 14,
            fontWeight: FontWeight.w400,
            color: AppColors.myCareerText,
          ),
          font16W700Color: AppTextStyles.h2.copyWith(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.myCareerText,
          ),
        ),
      ],
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.myCareerBackground,
        elevation: 0,
        centerTitle: false,
      ),
    );
  }
}
