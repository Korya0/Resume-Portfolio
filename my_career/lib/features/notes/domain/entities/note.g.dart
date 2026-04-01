// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'note.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Note _$NoteFromJson(Map<String, dynamic> json) => Note(
  id: json['id'] as String,
  title: json['title'] as String,
  content: json['content'] as String,
  sourceLink: json['sourceLink'] as String? ?? '',
  date: DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$NoteToJson(Note instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'content': instance.content,
  'sourceLink': instance.sourceLink,
  'date': instance.date.toIso8601String(),
};
