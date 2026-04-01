import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import '../../theme/colors/app_colors_extension.dart';
import '../../theme/typography/app_text_theme_extension.dart';

extension BuildContextExtension on BuildContext {
  // --- Theme & Colors ---
  AppColorsExtension get colors =>
      Theme.of(this).extension<AppColorsExtension>()!;

  TextTheme get textTheme => Theme.of(this).textTheme;

  AppTextThemeExtension get typography =>
      Theme.of(this).extension<AppTextThemeExtension>()!;

  // --- Screen Dimensions (Media Query Helpers) ---
  double get width => MediaQuery.sizeOf(this).width;
  double get height => MediaQuery.sizeOf(this).height;
  
  // Custom Breakpoints
  bool get isMobile => width < 600;
  bool get isTablet => width >= 600 && width < 1024;
  bool get isDesktop => width >= 1024;

  // --- Keyboard & Focus ---
  void unFocus() {
    FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      currentFocus.unfocus();
    }
  }

  // --- Platform Detection ---
  bool get isIOS => Theme.of(this).platform == TargetPlatform.iOS;
  bool get isAndroid => Theme.of(this).platform == TargetPlatform.android;
  bool get isWeb => kIsWeb;
}
