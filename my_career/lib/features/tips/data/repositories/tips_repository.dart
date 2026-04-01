import 'dart:convert';
import 'package:my_career/core/storage/local_storage_service.dart';
import 'package:my_career/core/storage/storage_keys.dart';
import 'package:my_career/features/tips/domain/entities/tip.dart';

class TipsRepository {
  final LocalStorageService _storageService;
  static const String _tipsKey = StorageKeys.tipsKey;

  TipsRepository(this._storageService);

  Future<List<Tip>> getTips() async {
    final String? data = _storageService.getString(_tipsKey);
    if (data == null || data.isEmpty) return [];

    final List<dynamic> jsonList = jsonDecode(data);
    return jsonList.map((json) => Tip.fromJson(json)).toList();
  }

  Future<bool> saveTips(List<Tip> tips) async {
    final List<Map<String, dynamic>> jsonList = tips
        .map((t) => t.toJson())
        .toList();
    final String encodedData = jsonEncode(jsonList);
    return await _storageService.setString(_tipsKey, encodedData);
  }
}
