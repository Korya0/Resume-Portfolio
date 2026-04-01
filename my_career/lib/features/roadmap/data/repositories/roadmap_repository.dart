import 'dart:convert';
import 'package:my_career/core/storage/local_storage_service.dart';
import 'package:my_career/core/storage/storage_keys.dart';
import 'package:my_career/features/roadmap/domain/entities/roadmap_section.dart';

class RoadmapRepository {
  final LocalStorageService _storageService;
  static const String _roadmapKey = StorageKeys.roadmapKey;

  RoadmapRepository(this._storageService);

  Future<List<RoadmapSection>> getSections() async {
    final String? data = _storageService.getString(_roadmapKey);
    if (data == null || data.isEmpty) return [];

    final List<dynamic> jsonList = jsonDecode(data);
    return jsonList.map((json) => RoadmapSection.fromJson(json)).toList();
  }

  Future<bool> saveSections(List<RoadmapSection> sections) async {
    final List<Map<String, dynamic>> jsonList = sections
        .map((s) => s.toJson())
        .toList();
    final String encodedData = jsonEncode(jsonList);
    return await _storageService.setString(_roadmapKey, encodedData);
  }
}
