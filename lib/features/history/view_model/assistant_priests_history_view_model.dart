import 'dart:convert';

import 'package:cascia_church_app/features/history/model/history.dart';
import 'package:cascia_church_app/features/history/model/priest_history.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;

final assistantPriestsHistoryViewModelProvider =
    Provider<AssistantPriestsHistoryViewModel>((ref) {
  return AssistantPriestsHistoryViewModel(ref: ref);
});

class AssistantPriestsHistoryViewModel {
  AssistantPriestsHistoryViewModel({
    required this.ref,
  });

  final ProviderRef ref;

  late List<PriestHistory> _assistantPriests;

  List<PriestHistory> get assistantPriests {
    return _assistantPriests;
  }

  set assistantPriests(List<PriestHistory> priests) {
    _assistantPriests = priests;
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
