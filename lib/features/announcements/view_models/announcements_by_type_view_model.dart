import 'package:cascia_church_app/features/announcements/models/announcement.dart';
import 'package:cascia_church_app/network/network_manager.dart';
import 'package:cascia_church_app/network/url_manager.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final announcementsByTypeViewModelProvider =
    Provider<AnnouncementsByTypeViewModel>((ref) {
  return AnnouncementsByTypeViewModel(ref: ref);
});

class AnnouncementsByTypeViewModel {
  AnnouncementsByTypeViewModel({
    required this.ref,
  });

  final ProviderRef ref;

  List<Announcement> _allAnnouncements = [];

  Future<List<Announcement>> fetchAllAnnouncements(String forNewsType) async {
    final networkMangerProvider = ref.read(networkManagerProvider);
    final urlProvider = ref.read(urlManagerProvider);
    final url = urlProvider.allAnnouncementssURL(forNewsType);
    try {
      final _response = await networkMangerProvider.getRequest(url: url);
      if (_response != null) {
        final Map<String, dynamic> _announcementsJson =
            Map<String, dynamic>.from(_response as Map<String, dynamic>);

        if (_announcementsJson.isNotEmpty) {
          final List<dynamic> _parsedAnnouncements =
              _announcementsJson['news'] as List<dynamic>;
          // final List<Map<String, dynamic>> _itemsJson =
          //     List<Map<String, dynamic>>.from(_parsedAnnouncements);
          final List<Announcement> _announcements =
              _parsedAnnouncements.map((_announcementObj) {
            return Announcement.fromJson(
                _announcementObj as Map<String, dynamic>);
          }).toList();
          _setAllAnnouncements(_announcements);
          return _announcements;
        }
        return [];
      } else {
        throw DioErrorType.other;
      }
    } catch (_) {
      rethrow;
    }
  }

  List<Announcement> getAllAnnouncements() {
    return _allAnnouncements;
  }

  int getAllAnnouncementsCount() {
    return _allAnnouncements.length;
  }

  void _setAllAnnouncements(List<Announcement> announcements) {
    _allAnnouncements = announcements;
  }

  String getAnnouncementKonkaniName(Announcement? announcement) {
    return announcement?.titleKn ?? '--';
  }

  String getAnnouncementEnglishName(Announcement? announcement) {
    return announcement?.title ?? '--';
  }

  //  String getAnnouncementNameAtIndex(int index) {
  //   final announcement = _getAnnouncementAtIndex(index);
  //   return (announcement != null) ? announcement.name : "--";
  // }

  Announcement? getAnnouncementAtIndex(int index) {
    return _allAnnouncements[index];
  }

  String getAnnouncementThumbnailUrlAtIndex(int index) {
    final announcement = getAnnouncementAtIndex(index);
    return (announcement != null) ? announcement.photoUrl : '--';
  }

  String getAnnouncementDescriptionAtIndex(int index) {
    final announcement = getAnnouncementAtIndex(index);
    return (announcement != null) ? announcement.description : '--';
  }
}
