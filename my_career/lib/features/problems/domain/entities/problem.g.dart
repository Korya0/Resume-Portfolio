// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'problem.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Problem _$ProblemFromJson(Map<String, dynamic> json) => Problem(
  id: json['id'] as String,
  title: json['title'] as String,
  tag: json['tag'] as String,
  difficulty: json['difficulty'] as String,
  description: json['description'] as String,
  solution: json['solution'] as String,
  date: DateTime.parse(json['date'] as String),
);

Map<String, dynamic> _$ProblemToJson(Problem instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'tag': instance.tag,
  'difficulty': instance.difficulty,
  'description': instance.description,
  'solution': instance.solution,
  'date': instance.date.toIso8601String(),
};
