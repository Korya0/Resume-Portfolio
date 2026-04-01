import 'package:flutter/services.dart';

/// 📳 HapticFeedbackHelper
/// Centralized utility to provide consistent tactile feedback across the app.
class HapticFeedbackHelper {
  const HapticFeedbackHelper._();

  static Future<void> light() async => await HapticFeedback.lightImpact();
  static Future<void> medium() async => await HapticFeedback.mediumImpact();
  static Future<void> heavy() async => await HapticFeedback.heavyImpact();
  static Future<void> selection() async => await HapticFeedback.selectionClick();

  static Future<void> successPattern() async {
    await HapticFeedback.mediumImpact();
    await Future.delayed(const Duration(milliseconds: 100));
    await HapticFeedback.mediumImpact();
  }

  static Future<void> errorPattern() async {
    await HapticFeedback.heavyImpact();
    await Future.delayed(const Duration(milliseconds: 50));
    await HapticFeedback.heavyImpact();
    await Future.delayed(const Duration(milliseconds: 50));
    await HapticFeedback.heavyImpact();
  }
}
