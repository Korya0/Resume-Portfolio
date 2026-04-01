import 'package:json_annotation/json_annotation.dart';

part 'roadmap_section.g.dart';

@JsonSerializable()
class RoadmapItem {
  final String id;
  final String title;
  final bool isCompleted;
  final List<String> tags; // ADV, NEW, LEAD, ALT
  final Map<String, bool> mastery; // WHY, HOW, DEEP, TEACH

  const RoadmapItem({
    required this.id,
    required this.title,
    this.isCompleted = false,
    this.tags = const [],
    this.mastery = const {
      'WHY': false,
      'HOW': false,
      'DEEP': false,
      'TEACH': false,
    },
  });

  factory RoadmapItem.fromJson(Map<String, dynamic> json) =>
      _$RoadmapItemFromJson(json);
  Map<String, dynamic> toJson() => _$RoadmapItemToJson(this);
}

@JsonSerializable()
class RoadmapSection {
  final String id;
  final String title;
  final List<RoadmapItem> items;

  const RoadmapSection({
    required this.id,
    required this.title,
    required this.items,
  });

  factory RoadmapSection.fromJson(Map<String, dynamic> json) =>
      _$RoadmapSectionFromJson(json);
  Map<String, dynamic> toJson() => _$RoadmapSectionToJson(this);
}
