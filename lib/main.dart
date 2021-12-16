import 'package:cascia_church_app/spash_screen_widget.dart';
import 'package:cascia_church_app/utility/shared_utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();
  runApp(
    ProviderScope(
      overrides: [
        // override the previous value with the new object
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: MaterialApp(
        theme: ThemeData(
          fontFamily: 'Lato',
        ),
        home: SplashScreenWidget(),
        debugShowCheckedModeBanner: false,
        builder: EasyLoading.init(),
      ),
    ),
  );
}
