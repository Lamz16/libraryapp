import 'package:shared_preferences/shared_preferences.dart';

import 'constant.dart';

class SharedPreferenceHelper {
  static SharedPreferences? _prefs;

  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setString(String key, String value) async {
    await _prefs?.setString(key, value);
  }

  static String? getString(String key) {
    return _prefs?.getString(key);
  }

  static Future<void> setBoolean(String key, bool value) async {
    await _prefs?.setBool(key, value);
  }

  static bool? getBoolean(String key) {
    return _prefs?.getBool(key);
  }

  static String? getToken() {
    return getString(Constant.keyToken);
  }

  static bool? getLogin(){
    return getBoolean(Constant.keyIsLogin);
  }

  static Future<void> setLogin(bool value) async{
    await setBoolean(Constant.keyIsLogin, value);
  }

  static Future<void> setToken(String value) async {
    await setString(Constant.keyToken, value);
  }

  static Future<void> clear()async{
    await _prefs?.clear();
  }

}