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

  late List<PriestHistory> _assistantPriests;

  Future<void> loadPriestsJson() async {
    final jsonBody = await rootBundle
        .loadString('assets/json/history/parish_priest_history.json');
    final priestsJson = json.decode(jsonBody);
    final priestList = priestsJson['results'] as List<dynamic>;
    _assistantPriests = priestList
        .map<PriestHistory>((priestJson) =>
            PriestHistory.fromJson(priestJson as Map<dynamic, dynamic>))
        .toList();
  }

  List<PriestHistory> getAllHistoryList() {
    return _assistantPriests;
  }

  int getAllHistorysCount() {
    return _assistantPriests.length;
  }

  PriestHistory? _getHistoryAtIndex(int index) {
    return _assistantPriests[index];
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
