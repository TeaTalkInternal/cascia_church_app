import 'dart:convert';
import 'package:cascia_church_app/features/history/model/priest_history.dart';
import 'package:cascia_church_app/features/history/view_model/assistant_priests_history_view_model.dart';
import 'package:cascia_church_app/features/history/view_model/priests_history_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Utility extends ChangeNotifier {
  // Utility({
  //   required this.ref,
  // });

  //final ProviderReference ref;
  final lightGradientShadecolor = const Color(0xff4eadfd);
  final darkGradientShadecolor = const Color(0xff2963f6);
  final headerTitleTextColor = const Color(0xffFFFFFF);

  final iconColor = const Color(0xffFFFFFF);
  final bodyTitleTextColor = const Color(0xff191919);
  final bodySubTitleTextColor = const Color(0xff413F42);
  final appGreyColor = const Color(0xffB2B2B2);
  final appDarkGreyColor = const Color(0xff1e2326);
  // final appBackgroundColor = const Color(0xffF4F9F9);
  final appBackgroundColor = const Color(0xffFFFFFF);

  //final Color scaffoldBackgroundColor = const Color(0XFFf8faff);
  final Color scaffoldBackgroundColor = const Color(0XFFFFFFFF);

  // Frame/Dimensions

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

  // String Extensions

  String getImageNameWithBasePath({required String imageName}) {
    return 'assets/images/$imageName';
  }

  void loadAllJson(WidgetRef ref) {
    loadAssistantPriestsJson(ref);
    loadPriestsJson(ref);
  }

  // Priets

  Future<void> loadAssistantPriestsJson(WidgetRef ref) async {
    final assistantHistoryViewModel =
        ref.read(assistantPriestsHistoryViewModelProvider);

    final jsonBody = await rootBundle
        .loadString('assets/json/history/assistant_parish_priest_history.json');
    final priestsJson = json.decode(jsonBody);
    final priestList = priestsJson['results'] as List<dynamic>;
    final assistantPriests = priestList
        .map<PriestHistory>((priestJson) =>
            PriestHistory.fromJson(priestJson as Map<dynamic, dynamic>))
        .toList();
    assistantHistoryViewModel.assistantPriests = assistantPriests;
  }

  Future<void> loadPriestsJson(WidgetRef ref) async {
    final priestHistoryViewModel = ref.read(priestsHistoryViewModelProvider);
    final jsonBody = await rootBundle
        .loadString('assets/json/history/parish_priest_history.json');
    final priestsJson = json.decode(jsonBody);
    final priestList = priestsJson['results'] as List<dynamic>;
    final priests = priestList
        .map<PriestHistory>((priestJson) =>
            PriestHistory.fromJson(priestJson as Map<dynamic, dynamic>))
        .toList();
    priestHistoryViewModel.allPriests = priests;
  }
}
