import 'package:json_annotation/json_annotation.dart';

part 'tip.g.dart';

@JsonSerializable()
class Tip {
  final String id;
  final String title;
  final String category;
  final String body;
  final String icon;

  const Tip({
    required this.id,
    required this.title,
    required this.category,
    required this.body,
    this.icon = '💡',
  });

  factory Tip.fromJson(Map<String, dynamic> json) => _$TipFromJson(json);
  Map<String, dynamic> toJson() => _$TipToJson(this);
}
