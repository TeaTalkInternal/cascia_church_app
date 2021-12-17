import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:cascia_church_app/spash_screen_widget.dart';
import 'package:cascia_church_app/utility/shared_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  // AppLanguage appLanguage = AppLanguage();
  // await appLanguage.fetchLocale();
  runApp(
    ProviderScope(
      overrides: [
        // override the previous value with the new object
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const HomePageWidget(),
    ),
  );
}

class HomePageWidget extends ConsumerStatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends ConsumerState<HomePageWidget> {
  @override
  void initState() {
    super.initState();
    final appLanguage = ref.read(appLanguageProvider);
    appLanguage.fetchLocale();
  }

  @override
  Widget build(BuildContext context) {
    final appLanguage = ref.watch(appLanguageProvider);
    return MaterialApp(
      locale: appLanguage.appLocal,
      supportedLocales: [
        Locale('en', 'US'),
        Locale('kn', ''),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      theme: ThemeData(
        fontFamily: 'Lato',
      ),
      home: SplashScreenWidget(),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
    );
  }
}
