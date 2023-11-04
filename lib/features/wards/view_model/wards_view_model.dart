import 'dart:convert';

import 'package:cascia_church_app/features/history/model/list_thumbnail.dart';
import 'package:cascia_church_app/features/history/model/priest_history.dart';
import 'package:cascia_church_app/features/wards/model/ward.dart';
import 'package:cascia_church_app/network/network_manager.dart';
import 'package:cascia_church_app/network/url_manager.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter/services.dart' show rootBundle;

final wardsViewModelProvider = Provider<WardsViewModel>((ref) {
  return WardsViewModel(ref: ref);
});

class WardsViewModel {
  WardsViewModel({
    required this.ref,
  });

  final ProviderRef ref;

  List<Ward> _allWards = [];

  Future<List<Ward>> fetchAllWards() async {
    final networkMangerProvider = ref.read(networkManagerProvider);
    final urlProvider = ref.read(urlManagerProvider);
    final url = urlProvider.allWardsURL;
    try {
      final _response = await networkMangerProvider.getRequest(url: url);
      if (_response != null) {
        final Map<String, dynamic> _wardsJson =
            Map<String, dynamic>.from(_response as Map<String, dynamic>);

        if (_wardsJson.isNotEmpty) {
          final List<dynamic> _parsedWards =
              _wardsJson['wards'] as List<dynamic>;
          // final List<Map<String, dynamic>> _itemsJson =
          //     List<Map<String, dynamic>>.from(_parsedWards);
          final List<Ward> _wards = _parsedWards.map((_wardObj) {
            return Ward.fromJson(_wardObj as Map<String, dynamic>);
          }).toList();
          _setAllWards(_wards);
          return _wards;
        }
        return [];
      } else {
        throw DioExceptionType.unknown;
      }
    } catch (_) {
      rethrow;
    }
  }

  List<Ward> getAllWards() {
    return _allWards;
  }

  int getAllWardsCount() {
    return _allWards.length;
  }

  void _setAllWards(List<Ward> wards) {
    _allWards = wards;
  }

  String getWardKonkaniName(Ward? ward) {
    return ward?.nameKn ?? '--';
  }

  String getWardEnglishName(Ward? ward) {
    return ward?.name ?? '--';
  }

  //  String getWardNameAtIndex(int index) {
  //   final ward = _getWardAtIndex(index);
  //   return (ward != null) ? ward.name : "--";
  // }

  Ward? getWardAtIndex(int index) {
    return _allWards[index];
  }

  String getWardThumbnailUrlAtIndex(int index) {
    final ward = getWardAtIndex(index);
    return (ward != null) ? ward.thumbnailUrl : '--';
  }

  String getWardDescriptionAtIndex(int index) {
    final ward = getWardAtIndex(index);
    return (ward != null) ? ward.description : '--';
  }
}
