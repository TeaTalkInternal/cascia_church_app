import 'package:cascia_church_app/features/timings/models/timing.dart';
import 'package:cascia_church_app/network/network_manager.dart';
import 'package:cascia_church_app/network/url_manager.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final timingViewModelProvider = Provider<TimingViewModel>((ref) {
  return TimingViewModel(ref: ref);
});

class TimingViewModel {
  TimingViewModel({
    required this.ref,
  });

  final ProviderRef ref;

  List<Timing> _allTimings = [];

  Future<List<Timing>> fetchAllTimings() async {
    final networkMangerProvider = ref.read(networkManagerProvider);
    final urlProvider = ref.read(urlManagerProvider);
    final url = urlProvider.allTimingsURL;
    try {
      final _response = await networkMangerProvider.getRequest(url: url);
      if (_response != null) {
        final Map<String, dynamic> _timingsJson =
            Map<String, dynamic>.from(_response as Map<String, dynamic>);

        if (_timingsJson.isNotEmpty) {
          final List<dynamic> _parsedTimings =
              _timingsJson['timings'] as List<dynamic>;
          // final List<Map<String, dynamic>> _itemsJson =
          //     List<Map<String, dynamic>>.from(_parsedTimings);

          final List<Timing> _timings = _parsedTimings.map((_timingObj) {
            return Timing.fromJson(_timingObj as Map<String, dynamic>);
          }).toList();
          _setAllTimings(_timings);
          return _timings;
        }
        return [];
      } else {
        throw DioExceptionType.unknown;
      }
    } catch (_) {
      rethrow;
    }
  }

  List<Timing> getAllTimings() {
    return _allTimings;
  }

  int getAllTimingsCount() {
    return _allTimings.length;
  }

  void _setAllTimings(List<Timing> timings) {
    _allTimings = timings;
  }

  List<String> getAllListHeaders() {
    return _allTimings
        .map((timingValue) => timingValue.massTypeName)
        .toSet()
        .toList();
  }

  String getTimingKonkaniTime(Timing? timing) {
    final time1 = timing?.dayKn ?? "--";
    final time2 = timing?.timingKn ?? '--';
    return time1 + ' ' + time2;
  }

  String getTimingEnglishTime(Timing? timing) {
    final time = timing?.day ?? '--' + (timing?.timing ?? '--');
    return time;
  }

  //  String getTimingNameAtIndex(int index) {
  //   final timing = _getTimingAtIndex(index);
  //   return (timing != null) ? timing.name : "--";
  // }

  Timing? getTimingAtIndex(int index) {
    return _allTimings[index];
  }

  String getTimingLanguage(Timing? timing) {
    return (timing != null) ? timing.language : '--';
  }

  String getTimingLanguageKn(Timing? timing) {
    return (timing != null) ? timing.languageKn : '--';
  }

  String getTimingDay(Timing? timing) {
    return (timing != null) ? timing.day : '--';
  }

  String getTimingDayKn(Timing? timing) {
    return (timing != null) ? timing.dayKn : '--';
  }

  String getMassTypeName(Timing? timing) {
    return (timing != null) ? timing.massTypeName : '--';
  }

  String getMassTypeNameKn(Timing? timing) {
    final massval = (timing != null) ? timing.massTypeNameKn : '--';
    //  print("massval $massval");
    if (timing?.massTypeKn != "novena") {
      return "";
    }
    return massval;
  }

  String getMassTypeHeaderKn(String groupByValue) {
    var header = "--";
    switch (groupByValue) {
      case 'sunday_liturgy':
        header = "ಪವಿತ್ರ್ ಮಿಸಾಚೆಂ ಬಲಿದಾನ್";
        break;
      case 'daily_mass':
        header = "ಹಫ್ತ್ಯಾಚಾ ದಿಸಾಂನಿ:";
        break;
      case 'catechism':
        header = "ಕ್ರಿಸ್ತಾಂವ್ ಶಿಕ್ಷಣ್";
        break;
      case 'sacrement':
        header = "ಪವಿತ್ರ್ ಸಾಕ್ರಾಮೆಂತಾಚೆಂ ಆರಾಧನ್";
        break;
      case 'novena':
        header = "ನೊವೆನಾಂ";
        break;
      default:
        header = "--";
    }
    return header;
  }
}
