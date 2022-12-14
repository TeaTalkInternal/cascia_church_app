import 'package:flutter_riverpod/flutter_riverpod.dart';

final urlManagerProvider = Provider<URLManager>((ref) {
  return URLManager();
});

class URLManager {
  String get baseURL {
    return 'https://cascia-admin.codeokplease.com/cascia-church-server/church/';
  }

  String get allWardsURL {
    return '${baseURL}wards';
  }

  String get allAssociationsURL {
    return '${baseURL}associations';
  }

  String allAnnouncementssURL(String forNewsType) {
    return '${baseURL}news/$forNewsType';
  }

  String get allContactsURL {
    return '${baseURL}contacts';
  }

  String get allInstitutionsURL {
    return '${baseURL}institutes';
  }

  String get allTimingsURL {
    return '${baseURL}timings';
  }

  String get fetchRelatedImagesURL {
    return 'https://api.cloudinary.com/v1_1/dzyj8elg4/resources/search';
  }
  // String encyclopediaImagesURL({required String query, required int nextPage}) {
  //   return '${baseURL}encyclopaedia?&page=$nextPage&limit=40&filter=$query';
  // }

}
