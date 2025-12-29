import 'package:db_proj/core/models/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum SharedPrefKeys {
  language,
  isLoggedIn,

  id,
  username,
  email,
  token,
  refreshToken,
}

class SharedPrefConfigs {
  SharedPrefConfigs._();
  static final SharedPrefConfigs _instance = SharedPrefConfigs._();
  factory SharedPrefConfigs() => _instance;

  late SharedPreferences _shPref;
  Future<void> init() async => _shPref = await SharedPreferences.getInstance();

  String get language => _shPref.getString(SharedPrefKeys.language.name) ?? "en";
  bool get isLoggedIn => _shPref.getBool(SharedPrefKeys.isLoggedIn.name) ?? false;
  String get getToken => _shPref.getString(SharedPrefKeys.token.name) ?? '';
  int get userId => _shPref.getInt(SharedPrefKeys.id.name) ?? 0;
  
  Future<void> saveUser({required User user}) async {
    await _shPref.setBool(SharedPrefKeys.isLoggedIn.name, true);
    await _shPref.setInt(SharedPrefKeys.id.name, user.id);
    await _shPref.setString(SharedPrefKeys.username.name, user.name);
    await _shPref.setString(SharedPrefKeys.email.name, user.email);
    await _shPref.setString(SharedPrefKeys.gender.name, user.gender);
    await _shPref.setString(SharedPrefKeys.token.name, 'Bearer ${user.token}');
    await _shPref.setString(SharedPrefKeys.refreshToken.name, 'Bearer ${user.refreshToken}');
  }

  Future<bool> logout() => _shPref.clear();
  Future<void> changeLanguage({required String lang}) => _shPref.setString(SharedPrefKeys.language.name, lang);

}