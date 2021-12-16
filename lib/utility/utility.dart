import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

class Utility extends ChangeNotifier {
  // Utility({
  //   required this.ref,
  // });

  //final ProviderReference ref;
  final lightGradientShadecolor = const Color(0xff4eadfd);
  final darkGradientShadecolor = const Color(0xff2963f6);
  final Color scaffoldBackgroundColor = const Color(0XFFfffffe);

  double getFullScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double getFullScreenHeight(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  double getHorizontalOffset(BuildContext context) {
    final mainScreenWidth = getFullScreenWidth(context);
    final mainContentWidth = getMainContentWidth(context);
    final horizontalOffset = (mainScreenWidth - mainContentWidth) / 2.0;
    return mainScreenWidth > 415.0 ? horizontalOffset : 15.0;
  }

  double getSideMenuWidth(BuildContext context) {
    final mainScreenWidth = getFullScreenWidth(context);
    final sideMenuWidth = mainScreenWidth > 415.0 ? 415.0 : mainScreenWidth;
    return sideMenuWidth;
  }

  double getMainViewOrigin(BuildContext context) {
    final mainScreenWidth = getFullScreenWidth(context);
    final sideMenuOrigin = mainScreenWidth > 415.0 ? 415.0 : mainScreenWidth;
    return sideMenuOrigin - 100.0;
  }

  double getMainContentWidth(BuildContext context) {
    final mainScreenWidth = getFullScreenWidth(context);
    final mainContentWidth =
        mainScreenWidth > 415.0 ? (mainScreenWidth - 200) : mainScreenWidth;
    return mainContentWidth;
  }

  double getMainContentHeight(BuildContext context) {
    final mainScreenHeight = getFullScreenHeight(context);
    final mainContentHeight =
        mainScreenHeight > 900.0 ? (mainScreenHeight - 200) : mainScreenHeight;
    return mainContentHeight;
  }
}
