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

  // String encyclopediaImagesURL({required String query, required int nextPage}) {
  //   return '${baseURL}encyclopaedia?&page=$nextPage&limit=40&filter=$query';
  // }

}
