import 'package:flutter/material.dart';
import 'package:news_app_aloha/core/extensions/theme_mode.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class CacheHelper{
  static SharedPreferences? _preferences;
  static const String _appModeKey='App Mode Key';
  static Future<void> init() async {
    _preferences ??= await SharedPreferences.getInstance();
  }
  static Future<bool?> saveAppMode({required ThemeMode mode}) async {
    var modeValue=mode.name.toString();
    return await _preferences?.setString(_appModeKey, modeValue);
  }
  static ThemeMode getAppMode() {
    var modeJson = _preferences?.getString(_appModeKey)?? '';
    return modeJson.getThemeMode();
  }
}