import 'dart:convert';
import 'package:my_career/core/storage/local_storage_service.dart';
import 'package:my_career/core/storage/storage_keys.dart';
import 'package:my_career/features/notes/domain/entities/note.dart';

class NotesRepository {
  final LocalStorageService _storageService;
  static const String _notesKey = StorageKeys.notesKey;

  NotesRepository(this._storageService);

  Future<List<Note>> getNotes() async {
    final String? data = _storageService.getString(_notesKey);
    if (data == null || data.isEmpty) return [];

    final List<dynamic> jsonList = jsonDecode(data);
    return jsonList.map((json) => Note.fromJson(json)).toList();
  }

  Future<bool> saveNotes(List<Note> notes) async {
    final List<Map<String, dynamic>> jsonList = notes
        .map((n) => n.toJson())
        .toList();
    final String encodedData = jsonEncode(jsonList);
    return await _storageService.setString(_notesKey, encodedData);
  }
}
