import 'package:flutter/material.dart';
import 'package:my_career/core/theme/app_fonts.dart';

abstract class AppTextStyles {
  // Base DM Sans
  static const TextStyle dmSansBase = TextStyle(
    fontFamily: AppFonts.dmSans,
    color: Colors.white,
  );

  // Base Space Mono
  static const TextStyle spaceMonoBase = TextStyle(
    fontFamily: AppFonts.spaceMono,
    color: Colors.white,
  );

  static TextStyle get h1 =>
      dmSansBase.copyWith(fontSize: 24, fontWeight: AppFonts.bold);

  static TextStyle get h2 =>
      dmSansBase.copyWith(fontSize: 20, fontWeight: AppFonts.bold);

  static TextStyle get body =>
      dmSansBase.copyWith(fontSize: 16, fontWeight: AppFonts.regular);

  static TextStyle get labelMono =>
      spaceMonoBase.copyWith(fontSize: 14, fontWeight: AppFonts.regular);

  static TextStyle get codeMono =>
      spaceMonoBase.copyWith(fontSize: 13, fontWeight: AppFonts.regular);
}
