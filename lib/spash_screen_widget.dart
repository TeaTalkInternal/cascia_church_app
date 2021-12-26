import 'dart:async';
import 'package:cascia_church_app/features/dashboard/pages/dashboard_page_widget.dart';
import 'package:cascia_church_app/providers/app_providers.dart';
import 'package:cascia_church_app/utility/utility.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SplashScreenWidget extends ConsumerStatefulWidget {
  @override
  _SplashScreenWidgetState createState() => _SplashScreenWidgetState();
}

class _SplashScreenWidgetState extends ConsumerState<SplashScreenWidget> {
  //late SharedPreferences sharedPreferences;
  late Timer _initializationTimer;
  @override
  void initState() {
    super.initState();
    //sharedUtilityProvider.
    // dependencyAssembler<SharedUtility>().initialize((bool isDone) {
    // });

    _initializationTimer = Timer(Duration(seconds: 2), () {
      // if (context.read(sharedUtilityProvider).getIsAppLoadedBefore() == false) {
      //   Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(
      //       builder: (BuildContext _context) => TutorialPageWidget(),
      //     ),
      //   );
      // } else if (context.read(sharedUtilityProvider).getIsLogggedIn() ==
      //     false) {
      //   Navigator.of(context).pushReplacement(
      //     MaterialPageRoute(
      //       builder: (BuildContext _context) => LoginPageWidget(),
      //     ),
      //   );
      // } else {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (BuildContext context) => DashboardPageWidget()));

      // }
    });
  }

  @override
  void dispose() {
    _initializationTimer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final utility = ref.read(utilityProvider);
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              // borderRadius: BorderRadius.all(
              //   Radius.circular(25.0),
              // ),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomLeft,
                colors: [
                  utility.darkGradientShadecolor,
                  utility.darkGradientShadecolor,
                  utility.lightGradientShadecolor,
                ],
              ),
            ),
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.end,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                //flex: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 1.5,
                        child: Image.asset(
                          'assets/images/cascia_logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 100.0,
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
