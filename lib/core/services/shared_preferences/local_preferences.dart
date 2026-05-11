import 'package:shared_preferences/shared_preferences.dart';

class LocalPreferences {
  static SharedPreferences? _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get _instance {
    if (_prefs == null) {
      throw Exception("LocalPreferences not initialized");
    }
    return _prefs!;
  }

  static String getString(String key, {String defaultValue = ''}) {
    return _instance.getString(key) ?? defaultValue;
  }

  static Future<bool> setString(String key, String value) {
    return _instance.setString(key, value);
  }

  static bool getBool(String key, {bool defaultValue = false}) {
    return _instance.getBool(key) ?? defaultValue;
  }

  static Future<bool> setBool(String key, bool value) {
    return _instance.setBool(key, value);
  }

  static Future<void> clear() async {
    await _instance.clear();
  }
}