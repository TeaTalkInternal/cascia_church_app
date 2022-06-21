import 'package:cascia_church_app/features/associations/models/association.dart';
import 'package:cascia_church_app/network/network_manager.dart';
import 'package:cascia_church_app/network/url_manager.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final associationViewModelProvider = Provider<AssociationViewModel>((ref) {
  return AssociationViewModel(ref: ref);
});

class AssociationViewModel {
  AssociationViewModel({
    required this.ref,
  });

  final ProviderRef ref;

  List<Association> _allAssociations = [];

  Future<List<Association>> fetchAllAssociations() async {
    final networkMangerProvider = ref.read(networkManagerProvider);
    final urlProvider = ref.read(urlManagerProvider);
    final url = urlProvider.allAssociationsURL;
    try {
      final _response = await networkMangerProvider.getRequest(url: url);
      if (_response != null) {
        final Map<String, dynamic> _associationsJson =
            Map<String, dynamic>.from(_response as Map<String, dynamic>);

        if (_associationsJson.isNotEmpty) {
          final List<dynamic> _parsedAssociations =
              _associationsJson['associations'] as List<dynamic>;
          // final List<Map<String, dynamic>> _itemsJson =
          //     List<Map<String, dynamic>>.from(_parsedAssociations);
          final List<Association> _associations =
              _parsedAssociations.map((_associationObj) {
            return Association.fromJson(
                _associationObj as Map<String, dynamic>);
          }).toList();
          _setAllAssociations(_associations);
          return _associations;
        }
        return [];
      } else {
        throw DioErrorType.other;
      }
    } catch (_) {
      rethrow;
    }
  }

  List<Association> getAllAssociations() {
    return _allAssociations;
  }

  int getAllAssociationsCount() {
    return _allAssociations.length;
  }

  void _setAllAssociations(List<Association> associations) {
    _allAssociations = associations;
  }

  String getAssociationKonkaniName(Association? association) {
    return association?.nameKn ?? '--';
  }

  String getAssociationEnglishName(Association? association) {
    return association?.name ?? '--';
  }

  //  String getAssociationNameAtIndex(int index) {
  //   final association = _getAssociationAtIndex(index);
  //   return (association != null) ? association.name : "--";
  // }

  Association? getAssociationAtIndex(int index) {
    return _allAssociations[index];
  }

  String getAssociationThumbnailUrlAtIndex(int index) {
    final association = getAssociationAtIndex(index);
    return (association != null) ? association.thumbnailUrl : '--';
  }

  String getAssociationDescriptionAtIndex(int index) {
    final association = getAssociationAtIndex(index);
    return (association != null) ? association.description : '--';
  }
}
