import 'package:cascia_church_app/features/institutions/models/institution.dart';
import 'package:cascia_church_app/network/network_manager.dart';
import 'package:cascia_church_app/network/url_manager.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final institutionViewModelProvider = Provider<InstitutionViewModel>((ref) {
  return InstitutionViewModel(ref: ref);
});

class InstitutionViewModel {
  InstitutionViewModel({
    required this.ref,
  });

  final ProviderRef ref;

  List<Institution> _allInstitutions = [];

  Future<List<Institution>> fetchAllInstitutions() async {
    final networkMangerProvider = ref.read(networkManagerProvider);
    final urlProvider = ref.read(urlManagerProvider);
    final url = urlProvider.allInstitutionsURL;
    try {
      final _response = await networkMangerProvider.getRequest(url: url);
      if (_response != null) {
        final Map<String, dynamic> _institutionsJson =
            Map<String, dynamic>.from(_response as Map<String, dynamic>);

        if (_institutionsJson.isNotEmpty) {
          final List<dynamic> _parsedInstitutions =
              _institutionsJson['institutes'] as List<dynamic>;
          // final List<Map<String, dynamic>> _itemsJson =
          //     List<Map<String, dynamic>>.from(_parsedInstitutions);

          final List<Institution> _institutions =
              _parsedInstitutions.map((_institutionObj) {
            return Institution.fromJson(
                _institutionObj as Map<String, dynamic>);
          }).toList();
          print(_institutions);
          _setAllInstitutions(_institutions);
          return _institutions;
        }
        return [];
      } else {
        throw DioExceptionType.unknown;
      }
    } catch (_) {
      rethrow;
    }
  }

  List<Institution> getAllInstitutions() {
    return _allInstitutions;
  }

  int getAllInstitutionsCount() {
    return _allInstitutions.length;
  }

  void _setAllInstitutions(List<Institution> institutions) {
    _allInstitutions = institutions;
  }

  String getInstitutionKonkaniName(Institution? institution) {
    return institution?.titleKn ?? '--';
  }

  String getInstitutionEnglishName(Institution? institution) {
    return institution?.title ?? '--';
  }

  //  String getInstitutionNameAtIndex(int index) {
  //   final institution = _getInstitutionAtIndex(index);
  //   return (institution != null) ? institution.name : "--";
  // }

  Institution? getInstitutionAtIndex(int index) {
    return _allInstitutions[index];
  }

  String getInstitutionThumbnailUrlAtIndex(int index) {
    final institution = getInstitutionAtIndex(index);
    return (institution != null) ? institution.thumbnailUrl : '--';
  }

  String getInstitutionAddress(Institution? institution) {
    return (institution != null) ? institution.address : '--';
  }

  String getInstitutionAddressKn(Institution? institution) {
    return (institution != null) ? institution.addressKn : '--';
  }
}
