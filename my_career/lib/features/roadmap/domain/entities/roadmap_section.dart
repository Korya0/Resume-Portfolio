import 'package:json_annotation/json_annotation.dart';
import 'roadmap_item.dart';

part 'roadmap_section.g.dart';

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
