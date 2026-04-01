import 'package:json_annotation/json_annotation.dart';

part 'note.g.dart';

@JsonSerializable()
class Note {
  final String id;
  final String title;
  final String content;
  final String sourceLink;
  final DateTime date;

  const Note({
    required this.id,
    required this.title,
    required this.content,
    this.sourceLink = '',
    required this.date,
  });

  factory Note.fromJson(Map<String, dynamic> json) => _$NoteFromJson(json);
  Map<String, dynamic> toJson() => _$NoteToJson(this);
}
