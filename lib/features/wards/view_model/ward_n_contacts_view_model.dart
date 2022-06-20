import 'package:cascia_church_app/features/history/model/list_thumbnail.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final wardsnContactsViewModelProvider =
    Provider<WardsNContactsViewModel>((ref) {
  return WardsNContactsViewModel(ref: ref);
});

class WardsNContactsViewModel {
  WardsNContactsViewModel({
    required this.ref,
  });

  final ProviderRef ref;

  final List<ListThumbnail> _allHistorys = [
    ListThumbnail(
      id: 'wards',
      title: 'wards',
      imageName: 'wards.jpg',
    ),
    ListThumbnail(
      id: 'families',
      title: 'families',
      imageName: 'families.jpg',
    )
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
