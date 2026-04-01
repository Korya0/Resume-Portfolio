import 'package:flutter/material.dart';
import '../../../../core/utils/extensions/build_context_extension.dart';
import '../../../../core/constants/app_constants.dart';

class TopNavBar extends StatelessWidget {
  final String title;

  const TopNavBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppConstants.topNavBarHeight,
      padding: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: context.colors.background.withValues(alpha: 0.8),
        border: Border(bottom: BorderSide(color: context.colors.border, width: 1)),
      ),
      child: Row(
        children: [
          Text(
            title,
            style: context.typography.titleMedium.copyWith(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),
          // Placeholder for search or profile
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              color: context.colors.surface,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: context.colors.border),
            ),
            child: Row(
              children: [
                Icon(Icons.search, size: 18, color: context.colors.muted),
                const SizedBox(width: 8),
                Text(
                  AppConstants.searchPlaceholder,
                  style: context.typography.bodyRegular.copyWith(
                    color: context.colors.muted,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
