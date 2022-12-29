import 'package:cascia_church_app/features/history/model/list_thumbnail.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final announcementViewModelProvider = Provider<AnnouncementsViewModel>((ref) {
  return AnnouncementsViewModel(ref: ref);
});

class AnnouncementsViewModel {
  AnnouncementsViewModel({
    required this.ref,
  });

  final ProviderRef ref;

  final List<ListThumbnail> _allAnnouncements = [
    ListThumbnail(
      id: 'obituary',
      title: 'Obituary',
      imageName: 'obituary_icon.jpg',
    ),
    ListThumbnail(
      id: 'matrimony',
      title: 'Matrimony',
      imageName: 'matrimony-icon.jpg',
    ),
    ListThumbnail(
      id: 'general',
      title: 'General Announcements',
      imageName: 'general-announcements.png',
    ),
  ];

  List<ListThumbnail> getAllAnnouncementList() {
    return _allAnnouncements;
  }

  int getAllAnnouncementsCount() {
    return _allAnnouncements.length;
  }

  ListThumbnail? _getAnnouncementAtIndex(int index) {
    return _allAnnouncements[index];
  }

  String getAnnouncementTitleAtIndex(int index) {
    final announcement = _getAnnouncementAtIndex(index);
    print("announcement ${announcement?.title ?? "--"}");
    return (announcement != null) ? announcement.title : '--';
  }

  String getAnnouncementIdAtIndex(int index) {
    final announcement = _getAnnouncementAtIndex(index);
    return (announcement != null) ? announcement.id : 'general';
  }

  String getAnnouncementImageAtIndex(int index) {
    final announcement = _getAnnouncementAtIndex(index);
    return (announcement != null) ? announcement.imageName : '--';
  }
}
