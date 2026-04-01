// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roadmap_section.dart';

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
  mastery:
      (json['mastery'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as bool),
      ) ??
      const {'WHY': false, 'HOW': false, 'DEEP': false, 'TEACH': false},
);

Map<String, dynamic> _$RoadmapItemToJson(RoadmapItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isCompleted': instance.isCompleted,
      'tags': instance.tags,
      'mastery': instance.mastery,
    };

RoadmapSection _$RoadmapSectionFromJson(Map<String, dynamic> json) =>
    RoadmapSection(
      id: json['id'] as String,
      title: json['title'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => RoadmapItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$RoadmapSectionToJson(RoadmapSection instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'items': instance.items,
    };
