import 'package:flutter/material.dart';
import 'package:my_career/core/theme/app_fonts.dart';

class AppTheme {
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: const Color(0xFF08090F),
      fontFamily: AppFonts.dmSans,
      colorScheme: const ColorScheme.dark(
        surface: Color(0xFF1E1E24),
        primary: Color(0xFF5E6AD2),
      ),
    );
  }
}
