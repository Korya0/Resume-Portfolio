import 'package:shared_preferences/shared_preferences.dart';

abstract class LocalStorageService {
  Future<void> init();
  String? getString(String key);
  Future<bool> setString(String key, String value);
}

class LocalStorageServiceImpl implements LocalStorageService {
  late SharedPreferences _prefs;

  @override
  Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  @override
  String? getString(String key) {
    return _prefs.getString(key);
  }

  @override
  Future<bool> setString(String key, String value) async {
    return await _prefs.setString(key, value);
  }
}
