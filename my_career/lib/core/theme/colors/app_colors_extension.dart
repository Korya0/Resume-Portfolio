import 'package:flutter/material.dart';

class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color background;
  final Color surface;
  final Color surface2;
  final Color border;
  final Color border2;
  final Color accent;
  final Color accent2;
  final Color success;
  final Color warning;
  final Color error;
  final Color text;
  final Color muted;

  const AppColorsExtension({
    required this.background,
    required this.surface,
    required this.surface2,
    required this.border,
    required this.border2,
    required this.accent,
    required this.accent2,
    required this.success,
    required this.warning,
    required this.error,
    required this.text,
    required this.muted,
  });

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? background,
    Color? surface,
    Color? surface2,
    Color? border,
    Color? border2,
    Color? accent,
    Color? accent2,
    Color? success,
    Color? warning,
    Color? error,
    Color? text,
    Color? muted,
  }) {
    return AppColorsExtension(
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surface2: surface2 ?? this.surface2,
      border: border ?? this.border,
      border2: border2 ?? this.border2,
      accent: accent ?? this.accent,
      accent2: accent2 ?? this.accent2,
      success: success ?? this.success,
      warning: warning ?? this.warning,
      error: error ?? this.error,
      text: text ?? this.text,
      muted: muted ?? this.muted,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      background: Color.lerp(background, other.background, t)!,
      surface: Color.lerp(surface, other.surface, t)!,
      surface2: Color.lerp(surface2, other.surface2, t)!,
      border: Color.lerp(border, other.border, t)!,
      border2: Color.lerp(border2, other.border2, t)!,
      accent: Color.lerp(accent, other.accent, t)!,
      accent2: Color.lerp(accent2, other.accent2, t)!,
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      error: Color.lerp(error, other.error, t)!,
      text: Color.lerp(text, other.text, t)!,
      muted: Color.lerp(muted, other.muted, t)!,
    );
  }
}
