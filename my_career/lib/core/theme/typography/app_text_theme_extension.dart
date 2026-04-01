import 'package:flutter/material.dart';

class AppTextThemeExtension extends ThemeExtension<AppTextThemeExtension> {
  // DM Sans (Body/Headings)
  final TextStyle displayLarge;
  final TextStyle titleMedium;
  final TextStyle bodyRegular;
  // Space Mono (Labels, Counts, Tags)
  final TextStyle labelMono;
  final TextStyle codeMono;

  const AppTextThemeExtension({
    required this.displayLarge,
    required this.titleMedium,
    required this.bodyRegular,
    required this.labelMono,
    required this.codeMono,
  });

  @override
  ThemeExtension<AppTextThemeExtension> copyWith({
    TextStyle? displayLarge,
    TextStyle? titleMedium,
    TextStyle? bodyRegular,
    TextStyle? labelMono,
    TextStyle? codeMono,
  }) {
    return AppTextThemeExtension(
      displayLarge: displayLarge ?? this.displayLarge,
      titleMedium: titleMedium ?? this.titleMedium,
      bodyRegular: bodyRegular ?? this.bodyRegular,
      labelMono: labelMono ?? this.labelMono,
      codeMono: codeMono ?? this.codeMono,
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
    );
  }
}
