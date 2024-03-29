import 'package:cascia_church_app/features/history/model/list_thumbnail.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final historyViewModelProvider = Provider<HistoryViewModel>((ref) {
  return HistoryViewModel(ref: ref);
});

class HistoryViewModel {
  HistoryViewModel({
    required this.ref,
  });

  final ProviderRef ref;

  final List<ListThumbnail> _allHistorys = [
    ListThumbnail(
      id: 'Church History',
      title: 'church_history_title',
      imageName: 'church_list_icon.png',
    ),
    ListThumbnail(
      id: 'Parish Priests',
      title: 'parish_priest_title',
      imageName: 'priest.png',
    ),
    ListThumbnail(
      id: 'Assistant Parish Priests',
      title: 'asst_parish_priest_title',
      imageName: 'assistant_priest.png',
    ),
  ];

  List<ListThumbnail> getAllHistoryList() {
    return _allHistorys;
  }

  int getAllHistorysCount() {
    return _allHistorys.length;
  }

  ListThumbnail? _getHistoryAtIndex(int index) {
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
