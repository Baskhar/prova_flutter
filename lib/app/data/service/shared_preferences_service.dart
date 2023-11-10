import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static SharedPreferences get prefs {
    if (_prefs == null) {
      throw Exception("SharedPreferences not initialized. Call init() first.");
    }
    return _prefs;
  }
}