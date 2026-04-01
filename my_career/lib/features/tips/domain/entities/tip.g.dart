// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Tip _$TipFromJson(Map<String, dynamic> json) => Tip(
  id: json['id'] as String,
  title: json['title'] as String,
  category: json['category'] as String,
  body: json['body'] as String,
  icon: json['icon'] as String? ?? '💡',
);

Map<String, dynamic> _$TipToJson(Tip instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'category': instance.category,
  'body': instance.body,
  'icon': instance.icon,
};
