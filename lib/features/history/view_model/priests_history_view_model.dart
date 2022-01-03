import 'dart:convert';

import 'package:cascia_church_app/features/history/model/history.dart';
import 'package:cascia_church_app/features/history/model/priest_history.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;

final priestsHistoryViewModelProvider =
    Provider<PriestsHistoryViewModel>((ref) {
  return PriestsHistoryViewModel(ref: ref);
});

class PriestsHistoryViewModel {
  PriestsHistoryViewModel({
    required this.ref,
  });

  final ProviderRef ref;

  late List<PriestHistory> _allPriests;

  List<PriestHistory> get allPriests {
    return _allPriests;
  }

  set allPriests(List<PriestHistory> priests) {
    _allPriests = priests;
  }

  // void setAllPriests(List<PriestHistory> priests) {
  //   _assistantPriests = priests;
  // }

  int getAllHistorysCount() {
    return _allPriests.length;
  }

  PriestHistory? _getHistoryAtIndex(int index) {
    return _allPriests[index];
  }

  String getHistoryTitleAtIndex(int index) {
    final history = _getHistoryAtIndex(index);
    return (history != null) ? history.name : '--';
  }

  String getHistoryFromTimeAtIndex(int index) {
    final history = _getHistoryAtIndex(index);
    return (history != null) ? history.from : '--';
  }

  String getHistoryToTimeAtIndex(int index) {
    final history = _getHistoryAtIndex(index);
    return (history != null) ? history.to : '--';
  }
}
