import 'package:cascia_church_app/features/gallery/model/event_type.dart';
import 'package:cascia_church_app/features/gallery/model/photo.dart';
import 'package:cascia_church_app/features/history/model/history.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final galleryBaseViewModelProvider = Provider<GalleryBaseViewModel>((ref) {
  return GalleryBaseViewModel(ref: ref);
});

// final galleryEventsProvider = FutureProvider<List<EventType>>((ref) async {
//   final galleryBaseViewModel = ref.read(galleryBaseViewModelProvider);
//   return galleryBaseViewModel.fetchAllEventTypes();
// });

class GalleryBaseViewModel extends ChangeNotifier {
  GalleryBaseViewModel({
    required this.ref,
  });

  final ProviderRef ref;
  List<EventType> _allEventTypes = [];

  Future<List<EventType>> fetchAllEventTypes() async {
    print('CLEEDDDDDDDDDD');
    return Future.delayed(const Duration(seconds: 1), () {
      final allEvents = [
        EventType(
            id: 'church-images',
            eventName: 'Church Images Gallery',
            thumbnailUrl:
                'https://www.mangaloretoday.com/upimages/Cascia%20paris%20church%206sep16%20dis.jpg',
            imageUrl:
                'https://www.mangaloretoday.com/upimages/Cascia%20paris%20church%206sep16%20dis.jpg',
            description: 'Church Images Gallery'),
        EventType(
            id: 'event-images-2021',
            eventName: 'Hall Images Gallery',
            thumbnailUrl:
                'https://www.mangaloretoday.com/upimages/Cascia%20paris%20church%206sep16%20dis.jpg',
            imageUrl:
                'https://www.mangaloretoday.com/upimages/Cascia%20paris%20church%206sep16%20dis.jpg',
            description: 'Church Images Gallery'),
        EventType(
            id: 'xx3',
            eventName: 'Chritmas evet 2021',
            thumbnailUrl:
                'https://cdn.britannica.com/q:60/38/196638-131-7BF02881/Santa-Claus.jpg',
            imageUrl:
                'https://cdn.britannica.com/q:60/38/196638-131-7BF02881/Santa-Claus.jpg',
            description: 'Church Images Gallery')
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
    notifyListeners();
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
