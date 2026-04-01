import 'package:json_annotation/json_annotation.dart';

part 'sidebar_link.g.dart';

@JsonSerializable()
class SidebarLink {
  final String id;
  final String title;
  final String path;
  final String emoji;

  const SidebarLink({
    required this.id,
    required this.title,
    required this.path,
    required this.emoji,
  });

  factory SidebarLink.fromJson(Map<String, dynamic> json) =>
      _$SidebarLinkFromJson(json);
  Map<String, dynamic> toJson() => _$SidebarLinkToJson(this);
}
