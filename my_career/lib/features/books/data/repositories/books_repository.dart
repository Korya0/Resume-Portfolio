import 'dart:convert';
import 'package:my_career/core/storage/local_storage_service.dart';
import 'package:my_career/core/storage/storage_keys.dart';
import 'package:my_career/features/books/domain/entities/book.dart';

class BooksRepository {
  final LocalStorageService _storageService;
  static const String _booksKey = StorageKeys.booksKey;

  BooksRepository(this._storageService);

  Future<List<Book>> getBooks() async {
    final String? data = _storageService.getString(_booksKey);
    if (data == null || data.isEmpty) return [];

    final List<dynamic> jsonList = jsonDecode(data);
    return jsonList.map((json) => Book.fromJson(json)).toList();
  }

  Future<bool> saveBooks(List<Book> books) async {
    final List<Map<String, dynamic>> jsonList = books
        .map((b) => b.toJson())
        .toList();
    final String encodedData = jsonEncode(jsonList);
    return await _storageService.setString(_booksKey, encodedData);
  }
}
