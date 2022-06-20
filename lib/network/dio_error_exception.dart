import 'package:dio/dio.dart';

class DioErrorException implements Exception {
  DioErrorException.fromDioError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.cancel:
        message = 'Request to API server was cancelled';
        break;
      case DioErrorType.connectTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioErrorType.other:
        message =
            'No internet connection. Make sure your Wi-Fi or mobile data is turned on, then try again.';
        break;
      case DioErrorType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;
      case DioErrorType.response:
        message =
            _handleError(statusCode: dioError.response?.statusCode ?? 400);
        break;
      case DioErrorType.sendTimeout:
        message = 'Send timeout in connection with API server';
        break;
      default:
        message = 'Something went wrong';
        break;
    }
  }

  late String message;

  String _handleError({required int statusCode}) {
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 404:
        return 'The requested resource was not found';
      case 500:
        return 'Internal server error';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
