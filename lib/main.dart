import 'package:cascia_church_app/localization/app_language.dart';
import 'package:cascia_church_app/localization/app_localizations.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:cascia_church_app/spash_screen_widget.dart';
import 'package:cascia_church_app/utility/shared_utility.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'generated/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();
  //  final AppLanguage appLanguage = AppLanguage(ref: ref);
  //  await appLanguage.fetchLocale();
  runApp(
    EasyLocalization(
      supportedLocales: [
        Locale('en'),
        Locale('kn'),
      ],
      path: 'assets/language',
      fallbackLocale: Locale('kn'),
      assetLoader: const CodegenLoader(),
      child: ProviderScope(
        overrides: [
          // override the previous value with the new object
          sharedPreferencesProvider.overrideWithValue(sharedPreferences),
        ],
        child: HomePageWidget(),
      ),
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
    print("Locale is  ${appLanguage.appLocal}");
    context.setLocale(appLanguage.appLocal);
  }

  @override
  Widget build(BuildContext context) {
    final appLanguage = ref.watch(appLanguageProvider);
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: appLanguage.appLocal,
      // locale: appLanguage.appLocal,
      // supportedLocales: [
      //   Locale('en', 'US'),
      //   Locale('kn', ''),
      // ],
      // localizationsDelegates: [
      //   AppLocalizations.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate,
      // ],
      theme: ThemeData(
        fontFamily: 'Roboto',
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SplashScreenWidget(),
      debugShowCheckedModeBanner: false,
      builder: EasyLoading.init(),
    );
  }
}
