import 'package:flutter/material.dart';

class AppTextThemeExtension extends ThemeExtension<AppTextThemeExtension> {
  // Headings
  final TextStyle displayLarge;
  final TextStyle titleMedium;
  final TextStyle font12W700Color; // Added requested naming style
  final TextStyle font14W400Color;
  final TextStyle font16W700Color;
  
  // Body
  final TextStyle bodyRegular;
  
  // Mono
  final TextStyle labelMono;
  final TextStyle codeMono;

  const AppTextThemeExtension({
    required this.displayLarge,
    required this.titleMedium,
    required this.bodyRegular,
    required this.labelMono,
    required this.codeMono,
    required this.font12W700Color,
    required this.font14W400Color,
    required this.font16W700Color,
  });

  @override
  ThemeExtension<AppTextThemeExtension> copyWith({
    TextStyle? displayLarge,
    TextStyle? titleMedium,
    TextStyle? bodyRegular,
    TextStyle? labelMono,
    TextStyle? codeMono,
    TextStyle? font12W700Color,
    TextStyle? font14W400Color,
    TextStyle? font16W700Color,
  }) {
    return AppTextThemeExtension(
      displayLarge: displayLarge ?? this.displayLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      bodyRegular: bodyRegular ?? this.bodyRegular,
      labelMono: labelMono ?? this.labelMono,
      codeMono: codeMono ?? this.codeMono,
      font12W700Color: font12W700Color ?? this.font12W700Color,
      font14W400Color: font14W400Color ?? this.font14W400Color,
      font16W700Color: font16W700Color ?? this.font16W700Color,
    );
  }

  @override
  ThemeExtension<AppTextThemeExtension> lerp(
    covariant ThemeExtension<AppTextThemeExtension>? other,
    double t,
  ) {
    if (other is! AppTextThemeExtension) return this;
    return AppTextThemeExtension(
      displayLarge: TextStyle.lerp(displayLarge, other.displayLarge, t)!,
      titleMedium: TextStyle.lerp(titleMedium, other.titleMedium, t)!,
      bodyRegular: TextStyle.lerp(bodyRegular, other.bodyRegular, t)!,
      labelMono: TextStyle.lerp(labelMono, other.labelMono, t)!,
      codeMono: TextStyle.lerp(codeMono, other.codeMono, t)!,
      font12W700Color: TextStyle.lerp(font12W700Color, other.font12W700Color, t)!,
      font14W400Color: TextStyle.lerp(font14W400Color, other.font14W400Color, t)!,
      font16W700Color: TextStyle.lerp(font16W700Color, other.font16W700Color, t)!,
    );
  }
}
