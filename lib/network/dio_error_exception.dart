import 'package:dio/dio.dart';

class DioErrorException implements Exception {
  DioErrorException.fromDioException(DioException dioException) {
    switch (dioException.type) {
      case DioExceptionType.cancel:
        message = 'Request to API server was cancelled';
        break;
      case DioExceptionType.connectionTimeout:
        message = 'Connection timeout with API server';
        break;
      case DioExceptionType.unknown:
        message =
            'No internet connection. Make sure your Wi-Fi or mobile data is turned on, then try again.';
        break;
      case DioExceptionType.receiveTimeout:
        message = 'Receive timeout in connection with API server';
        break;
      case DioExceptionType.badResponse:
        message =
            _handleError(statusCode: dioException.response?.statusCode ?? 400);
        break;
      case DioExceptionType.sendTimeout:
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
