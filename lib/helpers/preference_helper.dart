import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static String dataKey = "PreviousQuoteData";

  static Future<void> setData(List<String> value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList(dataKey, value);
  }

  static Future<List<String>?> getData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(dataKey);
  }

  static Future<void> addData(String newData) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? currentData = prefs.getStringList(dataKey) ?? [];
    currentData.add(newData);
    prefs.setStringList(dataKey, currentData);
  }

  static Future<void> removeData(String dataToRemove) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? currentData = prefs.getStringList(dataKey) ?? [];
    currentData.remove(dataToRemove);
    prefs.setStringList(dataKey, currentData);
  }

  static Future<void> clearData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(dataKey);
  }
}
