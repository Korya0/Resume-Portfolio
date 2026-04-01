import 'package:flutter/material.dart';
import '../utils/extensions/build_context_extension.dart';

class AppLegendPill extends StatelessWidget {
  final String label;

  const AppLegendPill({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    Color pillColor = context.colors.accent;
    String lowerLabel = label.toLowerCase();
    if (lowerLabel.contains('why')) {
      pillColor = context.colors.accent2; // Purple
    } else if (lowerLabel.contains('how')) {
      pillColor = context.colors.accent; // Cyan
    } else if (lowerLabel.contains('deep')) {
      pillColor = context.colors.warning; // Orange
    } else if (lowerLabel.contains('teach')) {
      pillColor = context.colors.success; // Green
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: pillColor.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: pillColor.withValues(alpha: 0.5)),
      ),
      child: Text(
        label,
        style: context.typography.labelMono.copyWith(
          color: pillColor,
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
