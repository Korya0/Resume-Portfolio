// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mastery_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MasteryInfo _$MasteryInfoFromJson(Map<String, dynamic> json) => MasteryInfo(
  why: json['WHY'] as bool? ?? false,
  how: json['HOW'] as bool? ?? false,
  deep: json['DEEP'] as bool? ?? false,
  teach: json['TEACH'] as bool? ?? false,
);

Map<String, dynamic> _$MasteryInfoToJson(MasteryInfo instance) =>
    <String, dynamic>{
      'WHY': instance.why,
      'HOW': instance.how,
      'DEEP': instance.deep,
      'TEACH': instance.teach,
    };
