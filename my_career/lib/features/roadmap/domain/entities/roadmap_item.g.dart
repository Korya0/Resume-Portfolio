// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roadmap_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoadmapItem _$RoadmapItemFromJson(Map<String, dynamic> json) => RoadmapItem(
  id: json['id'] as String,
  title: json['title'] as String,
  isCompleted: json['isCompleted'] as bool? ?? false,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const [],
  mastery: json['mastery'] == null
      ? const MasteryInfo()
      : MasteryInfo.fromJson(json['mastery'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RoadmapItemToJson(RoadmapItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'tags': instance.tags,
      'mastery': instance.mastery,
    };
