import 'package:beiti_care/common/constants/global_variables.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@singleton
class PreferencesRepository {
  final SharedPreferences _preferences;
  PreferencesRepository(this._preferences);

  // Save a String value to SharedPreferences
  Future<void> setString(String key, String value,
      {VoidCallback? onError}) async {
    try {
      await _preferences.setString(key, value);
    } catch (e) {
      logger.e('Error saving $key: $e');
      onError?.call();
    }
  }

  Future<void> setStringList(String key, List<String> value,
      {VoidCallback? onError}) async {
    try {
      await _preferences.setStringList(key, value);
    } catch (e) {
      logger.e('Error saving $key: $e');
      onError?.call();
    }
  }

  List<String>? getStringList(String key, {VoidCallback? onError}) {
    try {
      return _preferences.getStringList(key);
    } catch (e) {
      logger.e('Error getting $key: $e');
      onError?.call();
      return null;
    }
  }

  // Get a String value from SharedPreferences
  String? getString(String key, {VoidCallback? onError}) {
    try {
      return _preferences.getString(key);
    } catch (e) {
      logger.e('Error getting $key: $e');
      onError?.call();
      return null;
    }
  }

  // Save an int value to SharedPreferences
  Future<void> setInt(String key, int value, {VoidCallback? onError}) async {
    try {
      await _preferences.setInt(key, value);
    } catch (e) {
      logger.e('Error saving $key: $e');
      onError?.call();
    }
  }

  // Get an int value from SharedPreferences
  int? getInt(String key, {VoidCallback? onError}) {
    try {
      return _preferences.getInt(key);
    } catch (e) {
      logger.e('Error getting $key: $e');
      onError?.call();
      return null;
    }
  }

  // Clear a value from SharedPreferences
  Future<void> clearValue(String key, {VoidCallback? onError}) async {
    try {
      await _preferences.remove(key);
    } catch (e) {
      logger.e('Error clearing $key: $e');
      onError?.call();
    }
  }

  // Clear all values from SharedPreferences
  Future<void> clearAll({VoidCallback? onError}) async {
    try {
      await _preferences.clear();
    } catch (e) {
      logger.e('Error clearing all preferences: $e');
      onError?.call();
    }
  }
  
}
