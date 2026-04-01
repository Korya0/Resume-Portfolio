import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/build_context_extension.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final int completedCount;
  final int totalCount;
  final bool isExpanded;
  final VoidCallback onTap;

  const SectionHeader({
    super.key,
    required this.title,
    required this.completedCount,
    required this.totalCount,
    required this.isExpanded,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final progress = totalCount == 0 ? 0.0 : completedCount / totalCount;

    return ListTile(
      onTap: onTap,
      title: Text(title, style: context.typography.font16W700Color),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$completedCount/$totalCount Topics Completed",
            style: context.typography.font12W700Color.copyWith(
              color: context.colors.muted,
            ),
          ),
          const SizedBox(height: 4),
          ClipRRect(
            borderRadius: BorderRadius.circular(2),
            child: LinearProgressIndicator(
              value: progress,
              backgroundColor: context.colors.border,
              color: context.colors.accent,
              minHeight: 4,
            ),
          ),
        ],
      ),
      trailing: Icon(
        isExpanded ? Icons.expand_less : Icons.expand_more,
        color: context.colors.muted,
      ),
    );
  }
}
