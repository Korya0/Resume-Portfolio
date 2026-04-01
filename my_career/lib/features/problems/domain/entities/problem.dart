import 'package:json_annotation/json_annotation.dart';

part 'problem.g.dart';

@JsonSerializable()
class Problem {
  final String id;
  final String title;
  final String tag;
  final String difficulty;
  final String description;
  final String solution;
  final DateTime date;

  const Problem({
    required this.id,
    required this.title,
    required this.tag,
    required this.difficulty,
    required this.description,
    required this.solution,
    required this.date,
  });

  factory Problem.fromJson(Map<String, dynamic> json) => _$ProblemFromJson(json);
  Map<String, dynamic> toJson() => _$ProblemToJson(this);
}
