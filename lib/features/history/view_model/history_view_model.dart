import 'package:cascia_church_app/features/history/model/history.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final historyViewModelProvider = Provider<HistoryViewModel>((ref) {
  return HistoryViewModel(ref: ref);
});

class HistoryViewModel {
  HistoryViewModel({
    required this.ref,
  });

  final ProviderRef ref;

  final List<History> _allHistorys = [
    History(
      id: 'Church History',
      title: 'Church History',
      imageName: 'church_list_icon.png',
    ),
    History(
      id: 'Parish Priests',
      title: 'Parish Priests',
      imageName: 'priest.png',
    ),
    History(
      id: 'Assistant Parish Priests',
      title: 'Assistant Parish Priests',
      imageName: 'assistant_priest.png',
    ),
  ];

  List<History> getAllHistoryList() {
    return _allHistorys;
  }

  int getAllHistorysCount() {
    return _allHistorys.length;
  }

  History? _getHistoryAtIndex(int index) {
    return _allHistorys[index];
  }

  String getHistoryTitleAtIndex(int index) {
    final history = _getHistoryAtIndex(index);
    return (history != null) ? history.title : '--';
  }

  String getHistoryImageAtIndex(int index) {
    final history = _getHistoryAtIndex(index);
    return (history != null) ? history.imageName : '--';
  }
}
