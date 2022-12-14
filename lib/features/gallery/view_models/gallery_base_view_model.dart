import 'package:cascia_church_app/features/gallery/model/event_type.dart';
import 'package:cascia_church_app/features/gallery/model/photo.dart';
import 'package:cascia_church_app/features/history/model/list_thumbnail.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common_widgets/gallery/gallery_model.dart';
import '../../../network/network_manager.dart';
import '../../../network/url_manager.dart';
import '../model/related_image.dart';

final galleryBaseViewModelProvider = Provider<GalleryBaseViewModel>((ref) {
  return GalleryBaseViewModel(ref: ref);
});

class GalleryBaseViewModel {
  GalleryBaseViewModel({
    required this.ref,
  });

  final ProviderRef ref;
  List<EventType> _allEventTypes = [];

  Future<List<GalleryItemModel>> fetchAllImagesInAnimalFolder(
      String folderPath) async {
    final networkMangerProvider = ref.read(networkManagerProvider);
    final urlProvider = ref.read(urlManagerProvider);
    final url = urlProvider.fetchRelatedImagesURL;

    print("url : $url");
    var updatedFolderPath = "folder:" + folderPath;
    final params = {
      'expression': updatedFolderPath,
    };
    print("updatedFolderPath : $updatedFolderPath");
    try {
      final _response = await networkMangerProvider.postCloudinaryRequest(
        url: url,
        params: params,
      );
      if (_response != null) {
        final Map<String, dynamic> _imagesJson =
            Map<String, dynamic>.from(_response as Map<String, dynamic>);

        final List<Map<String, dynamic>> resources =
            List<Map<String, dynamic>>.from(_imagesJson["resources"] as List);
        final List<RealatedImage> _cardImages =
            resources.map((Map<String, dynamic> _imageObj) {
          return RealatedImage.fromJson(_imageObj);
        }).toList();
        print("length is ${_cardImages.length}");
        return _buildItemsList(_cardImages);
      } else {
        throw DioErrorType.other;
      }
    } catch (_) {
      rethrow;
    }
  }

  List<GalleryItemModel> _buildItemsList(List<RealatedImage> allcards) {
    List<GalleryItemModel> galleryItems = [];
    for (var item in allcards) {
      galleryItems.add(
        GalleryItemModel(id: item.publicId, imageUrl: item.url),
      );
    }
    return galleryItems;
  }

  Future<List<EventType>> fetchAllEventTypes() async {
    return Future.delayed(const Duration(seconds: 1), () {
      final allEvents = [
        EventType(
          id: 'catechism-year-opening-ceremony',
          eventName: 'Catechism year opening ceremony',
          thumbnailUrl:
              'https://res.cloudinary.com/dzyj8elg4/image/upload/v1670842038/cascia_church/all_events/catechism-year-opening-day/IMG-20220617-WA0026_vvsfaz_g3h900.jpg',
          imageUrl:
              'https://res.cloudinary.com/dzyj8elg4/image/upload/v1670842038/cascia_church/all_events/catechism-year-opening-day/IMG-20220617-WA0026_vvsfaz_g3h900.jpg',
          description: 'Catechism year opening ceremony',
          folderName: 'cascia_church/all_events/catechism-year-opening-day',
        ),
        EventType(
          id: 'govt-facilities-camp',
          eventName: 'Govt Facilities camp',
          thumbnailUrl:
              'https://res.cloudinary.com/dzyj8elg4/image/upload/v1670841855/cascia_church/all_events/govt-facilities-day/govt_2_w1p9du.jpg',
          imageUrl:
              'https://res.cloudinary.com/dzyj8elg4/image/upload/v1670841855/cascia_church/all_events/govt-facilities-day/govt_2_w1p9du.jpg',
          description: 'Govt Facilities camp',
          folderName: 'cascia_church/all_events/govt-facilities-day',
        ),
        EventType(
          id: 'senior-citizens-day',
          eventName: 'Senior Citizens Day',
          thumbnailUrl:
              'https://res.cloudinary.com/dzyj8elg4/image/upload/v1670841824/cascia_church/all_events/senior-citizens-day/senior_8_voe9fb.jpg',
          imageUrl:
              'https://res.cloudinary.com/dzyj8elg4/image/upload/v1670841824/cascia_church/all_events/senior-citizens-day/senior_8_voe9fb.jpg',
          description: 'Senior Citizens Day',
          folderName: 'cascia_church/all_events/senior-citizens-day',
        ),
      ];
      return allEventTypes = allEvents;
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

  List<EventType> get allEventTypes {
    return _allEventTypes;
  }

  set allEventTypes(List<EventType> allEvents) {
    _allEventTypes = allEvents;
    // notifyListeners();
  }

  int getAllEventTypesCount() {
    return _allEventTypes.length;
  }

  EventType? _getEventAtIndex(int index) {
    return _allEventTypes[index];
  }

  String getEventIdAtIndex(int index) {
    final event = _getEventAtIndex(index);
    return (event != null) ? event.id : '--';
  }

  String getEventNameAtIndex(int index) {
    final event = _getEventAtIndex(index);
    return (event != null) ? event.eventName : '--';
  }

  String getEventImageUrlAtIndex(int index) {
    final event = _getEventAtIndex(index);
    return (event != null) ? event.imageUrl : '--';
  }

  String getEventThumbnailUrlAtIndex(int index) {
    final event = _getEventAtIndex(index);
    return (event != null) ? event.thumbnailUrl : '--';
  }

  String getEventDescriptionAtIndex(int index) {
    final event = _getEventAtIndex(index);
    return (event != null) ? event.description : '--';
  }
}
