import 'package:flutter/material.dart';

class AppValidators {
  static String? required(BuildContext context, String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Field is required';
    }
    return null;
  }

  static String? email(BuildContext context, String? value) {
    final requiredError = required(context, value);
    if (requiredError != null) return requiredError;

    if (!value!.contains('@') || !value.contains('.')) {
      return 'Invalid email';
    }
    return null;
  }

  static String? password(BuildContext context, String? value) {
    if (value == null || value.length < 6) {
      return 'Password too short (min 6 characters)';
    }
    return null;
  }
}
