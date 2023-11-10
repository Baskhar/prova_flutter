import 'package:prova_flutter/app/data/service/shared_preferences_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TextRepository {
  static const _keyPreferences = 'texts';

  List<String> getAllTexts() {
    SharedPreferences prefs = SharedPreferencesService.prefs;
    print(prefs.getStringList(_keyPreferences) ?? []);

    return prefs.getStringList(_keyPreferences) ?? [];
  }

  Future<void> addText(String newText) async {
    SharedPreferences prefs = SharedPreferencesService.prefs;
    List<String> texts = prefs.getStringList(_keyPreferences) ?? [];
    texts.add(newText);
    final checkAdd = await prefs.setStringList(_keyPreferences, texts);
    print(checkAdd);
  }

  Future<void> updateText(List<String> newTexts) async {
    SharedPreferences prefs = SharedPreferencesService.prefs;
    await prefs.setStringList(_keyPreferences, newTexts);
  }

  Future<void> deleteText(String textToDelete) async {
    SharedPreferences prefs = SharedPreferencesService.prefs;
    List<String> texts = prefs.getStringList(_keyPreferences) ?? [];
    texts.remove(textToDelete);
    final checkDelete = await prefs.setStringList(_keyPreferences, texts);
    print(checkDelete);
  }
}
