// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sidebar_link.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SidebarLink _$SidebarLinkFromJson(Map<String, dynamic> json) => SidebarLink(
  id: json['id'] as String,
  title: json['title'] as String,
  path: json['path'] as String,
  emoji: json['emoji'] as String,
);

Map<String, dynamic> _$SidebarLinkToJson(SidebarLink instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'path': instance.path,
      'emoji': instance.emoji,
    };
