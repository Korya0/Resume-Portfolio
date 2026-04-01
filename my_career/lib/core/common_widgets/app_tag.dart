import 'package:flutter/material.dart';
import '../utils/extensions/build_context_extension.dart';

class AppTag extends StatelessWidget {
  final String text;
  final Color? color;

  const AppTag({super.key, required this.text, this.color});

  @override
  Widget build(BuildContext context) {
    final tagColor = color ?? context.colors.accent;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: tagColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: tagColor.withValues(alpha: 0.3)),
      ),
      child: Text(
        text.toUpperCase(),
        style: context.typography.labelMono.copyWith(
          color: tagColor,
          fontSize: 10,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
