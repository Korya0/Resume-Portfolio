import 'package:json_annotation/json_annotation.dart';
import 'mastery_info.dart';

part 'roadmap_item.g.dart';

@JsonSerializable()
class RoadmapItem {
  final String id;
  final String title;
  final bool isCompleted;
  final List<String> tags;
  final MasteryInfo mastery;

  const RoadmapItem({
    required this.id,
    required this.title,
    this.isCompleted = false,
    this.tags = const [],
    this.mastery = const MasteryInfo(),
  });

  factory RoadmapItem.fromJson(Map<String, dynamic> json) =>
      _$RoadmapItemFromJson(json);
  Map<String, dynamic> toJson() => _$RoadmapItemToJson(this);
}
