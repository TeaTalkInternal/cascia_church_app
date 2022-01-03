import 'package:cascia_church_app/features/gallery/model/photo.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final imagesGalleryViewModelProvider =
    Provider.family<ImagesGalleryViewModel, String>((ref, url) {
  return ImagesGalleryViewModel(ref: ref, fetchUrl: url);
});

// final churchGalleryImagesProvider = FutureProvider<List<Photo>>((ref) async {
//   final churchGalleryViewModel = ref.read(churchGalleryViewModelProvider);
//   return churchGalleryViewModel.fetchAllPhotos();
// });

class ImagesGalleryViewModel extends ChangeNotifier {
  ImagesGalleryViewModel({
    required this.ref,
    required this.fetchUrl,
  });

  final String fetchUrl;
  final ProviderRef ref;
  List<Photo> _allPhotos = [];

  Future<List<Photo>> fetchAllPhotos() async {
    return Future.delayed(const Duration(seconds: 1), () {
      final allImages = [
        Photo(
          id: 'xx1',
          title: 'Church outdoor Gallery',
          thumbnailUrl: 'https://i.quotev.com/uofkthtcurxa.jpg',
          imageUrl: 'https://i.quotev.com/uofkthtcurxa.jpg',
          isVideo: false,
          videoUrl: '',
        ),
        Photo(
          id: 'xx2',
          title: 'Church outdoor Gallery',
          thumbnailUrl:
              'https://www.mangaloretoday.com/upimages/Cascia%20paris%20church%206sep16%20dis.jpg',
          imageUrl:
              'https://www.mangaloretoday.com/upimages/Cascia%20paris%20church%206sep16%20dis.jpg',
          isVideo: false,
          videoUrl: '',
        ),
        Photo(
          id: 'xx3',
          title: 'Church outdoor Gallery',
          thumbnailUrl:
              'https://i.pinimg.com/originals/56/40/6a/56406a948513729da0f8cbc51cd631ca.jpg',
          imageUrl:
              'https://i.pinimg.com/originals/56/40/6a/56406a948513729da0f8cbc51cd631ca.jpg',
          isVideo: false,
          videoUrl: '',
        ),
        Photo(
          id: 'xx4',
          title: 'Church outdoor Gallery 4',
          thumbnailUrl:
              'https://img2.exportersindia.com/product_images/bc-small/dir_131/3918384/truck-cabin-2496522.jpg',
          imageUrl:
              'https://img2.exportersindia.com/product_images/bc-small/dir_131/3918384/truck-cabin-2496522.jpg',
          isVideo: false,
          videoUrl: '',
        ),
        Photo(
          id: 'xx5',
          title: 'Church outdoor Gallery 5',
          thumbnailUrl:
              'https://image.shutterstock.com/image-vector/dark-sky-abstract-geometric-pixelated-260nw-1501282334.jpg',
          imageUrl:
              'https://image.shutterstock.com/image-vector/dark-sky-abstract-geometric-pixelated-260nw-1501282334.jpg',
          isVideo: false,
          videoUrl: '',
        ),
        Photo(
          id: 'xx6',
          title: 'Church outdoor Gallery',
          thumbnailUrl: 'https://i.quotev.com/uofkthtcurxa.jpg',
          imageUrl: 'https://i.quotev.com/uofkthtcurxa.jpg',
          isVideo: false,
          videoUrl: '',
        ),
        Photo(
          id: 'xx7',
          title: 'Church outdoor Gallery',
          thumbnailUrl:
              'https://www.mangaloretoday.com/upimages/Cascia%20paris%20church%206sep16%20dis.jpg',
          imageUrl:
              'https://www.mangaloretoday.com/upimages/Cascia%20paris%20church%206sep16%20dis.jpg',
          isVideo: false,
          videoUrl: '',
        ),
        Photo(
          id: 'xx8',
          title: 'Church outdoor Gallery',
          thumbnailUrl:
              'https://i.pinimg.com/originals/56/40/6a/56406a948513729da0f8cbc51cd631ca.jpg',
          imageUrl:
              'https://i.pinimg.com/originals/56/40/6a/56406a948513729da0f8cbc51cd631ca.jpg',
          isVideo: false,
          videoUrl: '',
        ),
        Photo(
          id: 'xx9',
          title: 'Church outdoor Gallery 4',
          thumbnailUrl:
              'https://img2.exportersindia.com/product_images/bc-small/dir_131/3918384/truck-cabin-2496522.jpg',
          imageUrl:
              'https://img2.exportersindia.com/product_images/bc-small/dir_131/3918384/truck-cabin-2496522.jpg',
          isVideo: false,
          videoUrl: '',
        ),
        Photo(
          id: 'xx10',
          title: 'Goan Songs',
          thumbnailUrl:
              'https://i.pinimg.com/originals/1f/98/f2/1f98f27908696ba7b2c07ec5952dc7ab.jpg',
          imageUrl: '',
          isVideo: true,
          videoUrl: 'https://www.youtube.com/watch?v=KBBQBJhohM8&t=218s',
        ),
      ];
      return allPhotos = allImages;
    });
    // final networkMangerProvider = ref.read(networkManagerProvider);
    // final urlProvider = ref.read(urlManagerProvider);
    // final url =
    //     urlProvider.encyclopediaImagesURL(query: query, nextPage: nextPage);
    // try {
    //   final _response = await networkMangerProvider.getRequest(url: url);
    //   if (_response != null) {
    //     final Map<String, dynamic> _breedsJson =
    //         Map<String, dynamic>.from(_response as Map<String, dynamic>);

    //     final List<Map<String, dynamic>> _itemsJson =
    //         List<Map<String, dynamic>>.from(_breedsJson['items']);
    //     final List<Encyclopaedia> _breedImages =
    //         _itemsJson.map((Map<String, dynamic> _breedObj) {
    //       return Encyclopaedia.fromJson(_breedObj);
    //     }).toList();
    //     setAllPhotos(_breedImages);
    //     return _breedImages;
    //   } else {
    //     throw DioErrorType.other;
    //   }
    // } catch (_) {
    //   rethrow;
    // }
  }

  List<Photo> get allPhotos {
    return _allPhotos;
  }

  set allPhotos(List<Photo> allImages) {
    _allPhotos = allImages;
    notifyListeners();
  }

  int getAllPhotosCount() {
    return _allPhotos.length;
  }

  Photo? _getPhotoAtIndex(int index) {
    return _allPhotos[index];
  }

  String getPhotoNameAtIndex(int index) {
    final photo = _getPhotoAtIndex(index);
    return (photo != null) ? photo.title : '--';
  }

  String getPhotoImageUrlAtIndex(int index) {
    final photo = _getPhotoAtIndex(index);
    return (photo != null) ? photo.imageUrl : '--';
  }

  String getPhotoThumbnailUrlAtIndex(int index) {
    final photo = _getPhotoAtIndex(index);
    return (photo != null) ? photo.thumbnailUrl : '--';
  }

  String getPhotoVideoUrlAtIndex(int index) {
    final photo = _getPhotoAtIndex(index);
    return (photo != null) ? photo.videoUrl : '--';
  }

  bool getPhotoIsVideoTypeAtIndex(int index) {
    final photo = _getPhotoAtIndex(index);
    return (photo != null) ? photo.isVideo : false;
  }
}
