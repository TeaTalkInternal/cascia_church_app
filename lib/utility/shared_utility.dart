import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

/* ** Code Reference: https://codewithandrea.com/videos/flutter-state-management-riverpod/
***** The return type Future<SharedPreferences> isn't a 'SharedPreferences', as required by the closure's context.
***/
final sharedPreferencesProvider = Provider<SharedPreferences>((ref) {
  throw UnimplementedError();
});

final sharedUtilityProvider = Provider<SharedUtility>((ref) {
  final _sharedPrefs = ref.watch(sharedPreferencesProvider);
  return SharedUtility(sharedPreferences: _sharedPrefs);
});

// final sharedUtilityProvider = ChangeNotifierProvider<SharedUtility>((ref) {
//   final _sharedPrefs = ref.watch(sharedPreferencesProvider);
//   return SharedUtility(sharedPreferences: _sharedPrefs);
// });

class SharedUtility {
  SharedUtility({
    required this.sharedPreferences,
  });

  final SharedPreferences sharedPreferences;

  // bool getIsAppLoadedBefore() {
  //   return sharedPreferences.getBool('isAppLoadedBefore') ?? false;
  // }

  // void setIsAppLoadedBefore(bool isLoaded) {
  //   sharedPreferences.setBool('isAppLoadedBefore', isLoaded);
  // }

  // bool getIsLogggedIn() {
  //   return sharedPreferences.getBool('isLoggedIn') ?? false;
  // }

  // void setIsLogggedIn(bool isLoggedIn) {
  //   sharedPreferences.setBool('isLoggedIn', isLoggedIn);
  // }

  String getAppLanguageCode() {
    return sharedPreferences.getString('app_language_code') ?? '';
  }

  void setAppLanguageCode(String languageCode) {
    sharedPreferences.setString('app_language_code', languageCode);
  }

  String getAppLanguageCountryCode() {
    return sharedPreferences.getString('app_language_country_code') ?? '';
  }

  void setAppLanguageCountryCode(String languageCode) {
    sharedPreferences.setString('app_language_country_code', languageCode);
  }

  bool getIsDarkModeEnabled() {
    return sharedPreferences.getBool('app_dark_mode_enabled') ?? false;
  }

  void setIsDarkModeEnabled({required bool isEnabled}) {
    sharedPreferences.setBool('app_dark_mode_enabled', isEnabled);
  }
}
