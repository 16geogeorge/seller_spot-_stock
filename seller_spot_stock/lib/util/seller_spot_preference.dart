import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
class ImageRecoSharedPreference {
  // Creating singleton object.
  static ImageRecoSharedPreference _instance = new ImageRecoSharedPreference
      .internal();

  ImageRecoSharedPreference.internal();

  factory ImageRecoSharedPreference() => _instance;

  Future<bool> getBool(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool value = prefs.getBool(key) ?? false;
    return value;
  }

  Future<int> getInt(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    int value = prefs.getInt(key) ?? -1;
    return value;
  }

  Future<String> getString(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String value = prefs.getString(key) ?? "";
    return value;
  }

  setInt(String key, int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value);
  }

  setBoolean(String key, bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value);
  }

  setString(String key, String value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value);
  }

  clearAll() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }

  clearPreferanceKey(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove(key);
  }
}

class PreferenceKey {
  static const String IS_USER_LOGGED_IN = "is_user_logged_in";
  static const String FACEBOOK_ACCESS_TOKEN = "facebook_access-token";
  static const String CURRENT_USER_ID =  "current_user_id";
  static const String USER_NAME = "user_name";
  static const String PROFILE_URL = "profile_url";
  static const String SELECTED_TRACKABLE_ID = "selected_trackable_id";
  static const String APP_LANGUAGE = "selected_app_locale";
}