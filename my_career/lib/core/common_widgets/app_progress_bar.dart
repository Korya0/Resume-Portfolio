import 'package:flutter/material.dart';
import '../utils/extensions/build_context_extension.dart';
import '../constants/app_constants.dart';

class AppProgressBar extends StatelessWidget {
  final double progress; // 0.0 to 1.0

  const AppProgressBar({
    super.key,
    required this.progress,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 8,
      width: double.infinity,
      decoration: BoxDecoration(
        color: context.colors.border,
        borderRadius: BorderRadius.circular(4),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: AppConstants.progressAnimationDurationMs),
                width: constraints.maxWidth * progress.clamp(0.0, 1.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  gradient: LinearGradient(
                    colors: [context.colors.accent2, context.colors.accent],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
