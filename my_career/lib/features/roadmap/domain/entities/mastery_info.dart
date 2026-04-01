import 'package:json_annotation/json_annotation.dart';

part 'mastery_info.g.dart';

@JsonSerializable()
class MasteryInfo {
  @JsonKey(name: 'WHY')
  final bool why;
  @JsonKey(name: 'HOW')
  final bool how;
  @JsonKey(name: 'DEEP')
  final bool deep;
  @JsonKey(name: 'TEACH')
  final bool teach;

  const MasteryInfo({
    this.why = false,
    this.how = false,
    this.deep = false,
    this.teach = false,
  });

  factory MasteryInfo.fromJson(Map<String, dynamic> json) =>
      _$MasteryInfoFromJson(json);
  Map<String, dynamic> toJson() => _$MasteryInfoToJson(this);
}
