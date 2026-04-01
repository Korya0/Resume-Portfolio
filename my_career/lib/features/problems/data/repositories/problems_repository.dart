import 'dart:convert';
import 'package:my_career/core/storage/local_storage_service.dart';
import 'package:my_career/core/storage/storage_keys.dart';
import 'package:my_career/features/problems/domain/entities/problem.dart';

class ProblemsRepository {
  final LocalStorageService _storageService;
  static const String _problemsKey = StorageKeys.problemsKey;

  ProblemsRepository(this._storageService);

  Future<List<Problem>> getProblems() async {
    final String? data = _storageService.getString(_problemsKey);
    if (data == null || data.isEmpty) return [];

    final List<dynamic> jsonList = jsonDecode(data);
    return jsonList.map((json) => Problem.fromJson(json)).toList();
  }

  Future<bool> saveProblems(List<Problem> problems) async {
    final List<Map<String, dynamic>> jsonList = problems
        .map((p) => p.toJson())
        .toList();
    final String encodedData = jsonEncode(jsonList);
    return await _storageService.setString(_problemsKey, encodedData);
  }
}
