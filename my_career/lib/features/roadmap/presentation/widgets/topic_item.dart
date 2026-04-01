import 'package:flutter/material.dart';
import '../../../../core/utils/extensions/build_context_extension.dart';
import '../../../../core/common_widgets/app_tag.dart';
import '../../domain/entities/roadmap_item.dart';

class TopicItem extends StatelessWidget {
  final String sectionId;
  final RoadmapItem item;
  final VoidCallback onToggle;

  const TopicItem({
    super.key,
    required this.sectionId,
    required this.item,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Checkbox(
            value: item.isCompleted,
            onChanged: (_) => onToggle(),
            activeColor: context.colors.accent,
            side: BorderSide(color: context.colors.border2),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: context.typography.font14W400Color.copyWith(
                    color: item.isCompleted ? context.colors.muted : context.colors.text,
                    decoration: item.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                if (item.tags.isNotEmpty) ...[
                  const SizedBox(height: 4),
                  Wrap(
                    spacing: 4,
                    children: item.tags.map((tag) => AppTag(text: tag)).toList(),
                  ),
                ],
              ],
            ),
          ),
          // Mastery Pills logic can go here later (Phase 6 Master Modal)
          Icon(
            item.isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
            size: 16,
            color: item.isCompleted ? context.colors.success : context.colors.muted,
          ),
        ],
      ),
    );
  }
}
