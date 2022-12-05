import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsForm {
  /// Adding an integer value
  dynamic putInt(key, val) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var _res = prefs.setInt("$key", val);
    return _res;
  }

  /// Adding a string value
  dynamic putString(key, val) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var _res = prefs.setString("$key", val);
    return _res;
  }

  //Adding a double value
  dynamic putDouble(key, val) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var _res = prefs.setDouble("$key", val);
    return _res;
  }

  //Adding a bool value
  dynamic putBool(key, val) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var _res = prefs.setBool("$key", val);
    return _res;
  }

  //Adding a list of String;
  dynamic putListString(key, val) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var _res = prefs.setStringList("$key", val);
    return _res;
  }

  /// Adding a list or object
  /// Use import 'dart:convert'; for jsonEncode
  dynamic putJson(key, val) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    var valString = jsonEncode(val);
    var _res = prefs.setString("$key", valString);
    return _res;
  }

  /// Get integer value
  /// Argument [key]
  dynamic getInt(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    int? _res = prefs.getInt("$key");
    return _res;
  }

  /// Get string value
  /// Argument [key]
  dynamic getString(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String? _res = prefs.getString("$key");
    return _res;
  }

  //Get Double value
  /// Argument [key]
  dynamic getDouble(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    double? _res = prefs.getDouble("$key");
    return _res;
  }

  //Get Bool value
  /// Argument [key]
  dynamic getBool(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    bool? _res = prefs.getBool("$key");
    return _res;
  }

  //Get List String value
  ///Argument [key]
  dynamic getListString(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    List<String>? _res = prefs.getStringList(key);
    return _res;
  }

  /// Get list or object
  /// Use import 'dart:convert'; for jsonEncode
  /// Argument [key]
  dynamic getJson(key) async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    String? jsonString = prefs.getString("$key");
    var _res = jsonDecode(jsonString!);
    return _res;
  }

  Future reset() async {
    Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
  }
}
