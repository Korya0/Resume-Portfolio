import 'package:flutter/material.dart';
import '../utils/extensions/build_context_extension.dart';
import '../constants/app_constants.dart';

class AppCard extends StatefulWidget {
  final Widget child;
  final VoidCallback? onTap;
  final EdgeInsetsGeometry padding;

  const AppCard({
    super.key,
    required this.child,
    this.onTap,
    this.padding = const EdgeInsets.all(16.0),
  });

  @override
  State<AppCard> createState() => _AppCardState();
}

class _AppCardState extends State<AppCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: AppConstants.defaultAnimationDurationMs),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: _isHovered && widget.onTap != null
                ? context.colors.surface2
                : context.colors.surface,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _isHovered && widget.onTap != null
                  ? context.colors.accent
                  : context.colors.border,
              width: 1,
            ),
            boxShadow: _isHovered && widget.onTap != null
                ? [
                    BoxShadow(
                      color: context.colors.accent.withValues(alpha: 0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ]
                : [],
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
