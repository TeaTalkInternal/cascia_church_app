import 'package:cascia_church_app/utility/shared_utility.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppLanguage extends ChangeNotifier {
  AppLanguage({
    required this.ref,
  });
  final Ref ref;

  Locale _appLocale = Locale('kn');

  Locale get appLocal => _appLocale;

  fetchLocale() async {
    final sharedUtility = ref.watch(sharedUtilityProvider);

    if (sharedUtility.getAppLanguageCode().isEmpty) {
      _appLocale = Locale('kn');
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
      _appLocale = Locale("kn");
    } else {
      sharedUtility.setAppLanguageCode(type);
      sharedUtility.setAppLanguageCountryCode(country);
      _appLocale = country.isEmpty
          ? Locale(type)
          : Locale(
              type,
              country,
            );
      //context.setLocale(_appLocale);
    }
    notifyListeners();
  }

  bool get isEnglishLocale {
    return appLocal.languageCode == 'en';
  }
}
