import 'package:flutter/material.dart';
import '../utils/extensions/build_context_extension.dart';

class AppDangerButton extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const AppDangerButton({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: context.colors.error.withValues(alpha: 0.1),
        foregroundColor: context.colors.error,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: context.colors.error),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      child: Text(
        label,
        style: context.typography.bodyRegular.copyWith(
          color: context.colors.error,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
