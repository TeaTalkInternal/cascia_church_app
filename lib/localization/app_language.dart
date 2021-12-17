import 'package:cascia_church_app/utility/shared_utility.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  AppLanguage({
    required this.ref,
  });
  final Ref ref;

  Locale _appLocale = Locale('en_US');

  Locale get appLocal => _appLocale;

  fetchLocale() async {
    final sharedUtility = ref.watch(sharedUtilityProvider);

    if (sharedUtility.getAppLanguageCode().isEmpty) {
      _appLocale = Locale('en_US');
      return Null;
    }
    _appLocale = sharedUtility.getAppLanguageCountryCode().isEmpty
        ? Locale(sharedUtility.getAppLanguageCode())
        : Locale(sharedUtility.getAppLanguageCode(),
            sharedUtility.getAppLanguageCountryCode());
    return Null;
  }

  void changeLanguage({required String type, required String country}) {
    final sharedUtility = ref.watch(sharedUtilityProvider);

    if (type.isEmpty) {
      _appLocale = Locale("en_US");
    } else {
      sharedUtility.setAppLanguageCode(type);
      sharedUtility.setAppLanguageCountryCode(country);
      _appLocale = country.isEmpty
          ? Locale(type)
          : Locale(
              type,
              country,
            );
    }
    print('upadted $appLocal');
    notifyListeners();
  }

  bool get isEnglishLocale {
    print(appLocal.languageCode);
    return appLocal.languageCode == 'en';
  }
}

// class AppLanguage extends ChangeNotifier {
//   Locale? _appLocale = Locale('en');

//   Locale get appLocal => _appLocale ?? Locale("en_US");
//   fetchLocale() async {
//     var prefs = await SharedPreferences.getInstance();
//     if (prefs.getString('language_code') == null) {
//       _appLocale = Locale('en');
//       return Null;
//     }
//     _appLocale = Locale(prefs.getString('language_code'));
//     return Null;
//   }


//   void changeLanguage(Locale type) async {
//     var prefs = await SharedPreferences.getInstance();
//     if (_appLocale == type) {
//       return;
//     }
//     if (type == Locale("ar")) {
//       _appLocale = Locale("ar");
//       await prefs.setString('language_code', 'ar');
//       await prefs.setString('countryCode', '');
//     } else {
//       _appLocale = Locale("en_US");
//       await prefs.setString('language_code', 'en');
//       await prefs.setString('countryCode', 'US');
//     }
//     notifyListeners();
//   }
// }
