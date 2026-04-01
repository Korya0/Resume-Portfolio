import 'package:flutter/material.dart';
import 'app_colors_extension.dart';

class AppColors {
  AppColors._();

  // Dark Theme Static Colors (from original CSS :root)
  static const Color myCareerBackground = Color(0xFF08090f);
  static const Color myCareerSurface = Color(0xFF0f1118);
  static const Color myCareerSurface2 = Color(0xFF161820);
  static const Color myCareerBorder = Color(0xFF1e2235);
  static const Color myCareerBorder2 = Color(0xFF252840);
  
  static const Color myCareerAccent = Color(0xFF00d4ff); // Cyan
  static const Color myCareerAccent2 = Color(0xFF7c3aed); // Purple
  
  static const Color myCareerSuccess = Color(0xFF10b981); // done/accent3
  static const Color myCareerWarning = Color(0xFFf59e0b); // accent4
  static const Color myCareerError = Color(0xFFef4444);   // accent5
  
  static const Color myCareerText = Color(0xFFe2e8f0);
  static const Color myCareerMuted = Color(0xFF64748b);

  // The singleton extension instance for the dark theme
  static const AppColorsExtension darkColorsExtension = AppColorsExtension(
    background: myCareerBackground,
    surface: myCareerSurface,
    surface2: myCareerSurface2,
    border: myCareerBorder,
    border2: myCareerBorder2,
    accent: myCareerAccent,
    accent2: myCareerAccent2,
    success: myCareerSuccess,
    warning: myCareerWarning,
    error: myCareerError,
    text: myCareerText,
    muted: myCareerMuted,
  );
}
