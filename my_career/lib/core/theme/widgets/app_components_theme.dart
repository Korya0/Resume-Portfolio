import 'package:flutter/material.dart';

class AppComponentsTheme extends ThemeExtension<AppComponentsTheme> {
  const AppComponentsTheme();

  @override
  ThemeExtension<AppComponentsTheme> copyWith() {
    return const AppComponentsTheme();
  }

  @override
  ThemeExtension<AppComponentsTheme> lerp(
      ThemeExtension<AppComponentsTheme>? other, double t) {
    if (other is! AppComponentsTheme) {
      return this;
    }
    return const AppComponentsTheme();
  }
}
