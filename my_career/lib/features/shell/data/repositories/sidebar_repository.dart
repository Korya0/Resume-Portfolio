import 'dart:convert';
import 'package:my_career/core/storage/local_storage_service.dart';
import 'package:my_career/core/storage/storage_keys.dart';
import 'package:my_career/features/shell/domain/entities/sidebar_link.dart';

class SidebarRepository {
  final LocalStorageService _storageService;
  static const String _linksKey = StorageKeys.sidebarLinksKey;

  SidebarRepository(this._storageService);

  Future<List<SidebarLink>> getLinks() async {
    final String? data = _storageService.getString(_linksKey);
    if (data == null || data.isEmpty) return [];

    final List<dynamic> jsonList = jsonDecode(data);
    return jsonList.map((json) => SidebarLink.fromJson(json)).toList();
  }

  Future<bool> saveLinks(List<SidebarLink> links) async {
    final List<Map<String, dynamic>> jsonList = links
        .map((l) => l.toJson())
        .toList();
    final String encodedData = jsonEncode(jsonList);
    return await _storageService.setString(_linksKey, encodedData);
  }
}
