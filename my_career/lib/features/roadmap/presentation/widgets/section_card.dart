import 'package:flutter/material.dart';
import '../../../../core/utils/helpers/haptic_feedback_helper.dart';
import '../../../../core/common_widgets/app_card.dart';
import '../../domain/entities/roadmap_section.dart';
import 'topic_item.dart';
import 'section_header.dart';

class SectionCard extends StatefulWidget {
  final RoadmapSection section;
  final Function(String sectionId, String itemId) onToggleItem;

  const SectionCard({
    super.key,
    required this.section,
    required this.onToggleItem,
  });

  @override
  State<SectionCard> createState() => _SectionCardState();
}

class _SectionCardState extends State<SectionCard> {
  bool _isExpanded = true;

  @override
  Widget build(BuildContext context) {
    final completedCount = widget.section.items.where((i) => i.isCompleted).length;

    return AppCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          SectionHeader(
            title: widget.section.title,
            completedCount: completedCount,
            totalCount: widget.section.items.length,
            isExpanded: _isExpanded,
            onTap: () {
              HapticFeedbackHelper.selection();
              setState(() => _isExpanded = !_isExpanded);
            },
          ),
          if (_isExpanded) ...[
            const Divider(height: 1),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: widget.section.items.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: TopicItem(
                      sectionId: widget.section.id,
                      item: item,
                      onToggle: () {
                        HapticFeedbackHelper.light();
                        widget.onToggleItem(widget.section.id, item.id);
                      },
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
