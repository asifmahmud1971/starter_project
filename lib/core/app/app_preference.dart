import 'dart:convert';
import 'dart:developer';

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../features/screens/auth/sign_in/models/login_response.dart';
import 'app_dependency.dart';

const String prefsKeyLang = "prefsKeyLang";
const String prefsKeyIsUserLoggedIn = "prefsKeyIsUserLoggedIn";
const String prefsKeyUserLanguage = "prefsKeyUserLanguage";
const String prefsKeyUserLanguageName = "prefsKeyUserLanguageName";
const String prefsKeyUserCountryAbbreviation =
    "prefsKeyUserCountryAbbreviation";
const String prefsKeyAppDarkTheme = "prefsKeyAppDarkTheme";
const String prefsKeyUserInfo = "prefsKeyUserInfo";
const String prefsKeyUserToken = "prefsKeyUserToken";
const String prefsKeyHomeTutorial = "prefsKeyHomeTutorial";
const String prefsKeySessionTutorial = "prefsKeySessionTutorial";
const String prefsLastPlayList = "prefsLastPlayList";
const String prefsCurrentSession = "prefsCurrentSession";
const String prefsKeyFcmToken = "prefsKeyFcmToken";
const String prefsKeyAppOpen = "prefsKeyAppOpen";
const String prefsKeyPlayedAudio = "prefsKeyPlayedAudio";

@injectable
class AppPreferences {
  final _sharedPreferences = instance<SharedPreferences>();

  /// set preferences data start here ///

  Future<void> setIsUserLoggedIn(bool value) async {
    await _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, value);
  }

  Future<void> setUserToken(String token) async {
    await _sharedPreferences.setString(prefsKeyUserToken, token);
  }

  Future<void> setPlayedAudio(List<String> playedAudio) async {
    await _sharedPreferences.setStringList(prefsKeyPlayedAudio, playedAudio);
  }

  void setCurrentSession(String id) {
    _sharedPreferences.setString(prefsCurrentSession, id);
  }

  Future<void> saveUserData(User? userData) async {
    try {
      await _sharedPreferences.setString(
        prefsKeyUserInfo,
        json.encode(userData),
      );

      await setIsUserLoggedIn(true);
    } catch (e) {
      log('$runtimeType:: @saveUserData => $e');
    }
  }

  User getUserData() {
    if (_sharedPreferences.containsKey(prefsKeyUserInfo)) {
      return User.fromJson(
          json.decode(_sharedPreferences.getString(prefsKeyUserInfo)!));
    } else {
      return User();
    }
  }

  Future<void> setFCMToken(String? token) async {
    _sharedPreferences.setString(prefsKeyFcmToken, token ?? '');
  }

  Future<void> setLanguage(String? language) async {
    await _sharedPreferences.setString(prefsKeyUserLanguage, language ?? 'de');
  }

  Future<void> setLanguageName(String? languageName) async {
    await _sharedPreferences.setString(
      prefsKeyUserLanguageName,
      languageName ?? 'German',
    );
  }

  Future<void> setIsAppDarkTheme(bool isDark) async {
    _sharedPreferences.setBool(prefsKeyAppDarkTheme, isDark);
  }

  Future<void> setIsHomeTutorialSeen(bool isSeen) async {
    _sharedPreferences.setBool(prefsKeyHomeTutorial, isSeen);
  }

  Future<void> setIsSessionTutorialSeen(bool isSeen) async {
    _sharedPreferences.setBool(prefsKeySessionTutorial, isSeen);
  }

  Future<void> removeUserData() async {
    try {
      await _sharedPreferences.reload();

      await _sharedPreferences.remove(prefsKeyUserInfo);
      await _sharedPreferences.remove(prefsKeyUserToken);
      await _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
      await setIsUserLoggedIn(false);
    } catch (e) {
      log('$runtimeType:: @removeUserData => $e');
    }
  }

  Future<void> clearAudio() async {
    try {
      await _sharedPreferences.reload();

      await _sharedPreferences.remove(prefsKeyPlayedAudio);
    } catch (e) {
      log('$runtimeType:: @removeUserData => $e');
    }
  }

  /// set preferences data end here ///

  List<String> getPlayedAudioList() {
    List<String>? list = _sharedPreferences.getStringList(prefsKeyPlayedAudio);
    return list ?? [];
  }

  Future<String> getUserToken() async {
    return _sharedPreferences.getString(prefsKeyUserToken) ?? "";
  }

  String getCurrentSession() {
    return _sharedPreferences.getString(prefsCurrentSession) ?? "";
  }

  String getLanguage() {
    return _sharedPreferences.getString(prefsKeyUserLanguage) ?? 'en';
  }

  bool getIsAppDarkTheme() {
    return _sharedPreferences.getBool(prefsKeyAppDarkTheme) ?? false;
  }

  bool getIsHomeTutorialSeen() {
    return _sharedPreferences.getBool(prefsKeyHomeTutorial) ?? false;
  }

  bool getIsSessionTutorialSeen() {
    return _sharedPreferences.getBool(prefsKeySessionTutorial) ?? false;
  }

  String getFcmToken() {
    return _sharedPreferences.getString(prefsKeyFcmToken) ?? "";
  }

  int getAppOpens() {
    return _sharedPreferences.getInt(prefsKeyAppOpen) ?? 0;
  }

  Future<void> setAppOpenCount() async {
    int currentCount = getAppOpens();
    await _sharedPreferences.setInt(prefsKeyAppOpen, currentCount + 1);
  }

  bool isUserLoggedIn() {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  Future<void> logout() async {
    await removeUserData();
    await _sharedPreferences.remove(prefsKeyIsUserLoggedIn);
  }

  /// get preferences data end here ///
}
