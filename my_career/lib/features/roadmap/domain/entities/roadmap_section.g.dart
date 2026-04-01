// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'roadmap_section.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

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
