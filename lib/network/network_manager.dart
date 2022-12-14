import 'package:cascia_church_app/network/dio_error_exception.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

final networkManagerProvider = Provider<NetworkManager>((_) {
  return NetworkManager();
});

class NetworkManager {
  final Dio _dio = Dio();
  // final String _API_KEY = '6c560f27-2214-4bbe-954e-2ef42d20619b';

  final cloudinaryAccessKey =
      "OTU5NTMxMzQ0MjE5OTI2Ok9aSWtRQU0xZG1WRW9falF2aVpyZExOTW14bw==";
  //dotenv.env['CLOUDINARY_AUTH_KEY'];

  Map<String, String> _getRequestHeader() {
    //return {'x-api-key': _API_KEY, 'Content-Type': 'application/json'};
    return {'Content-Type': 'application/json'};
  }

  Map<String, String> _getCloudinaryRequestHeader() {
    return {
      'Authorization': "Basic ${cloudinaryAccessKey}",
      'Content-Type': 'application/json'
    };
  }

  Future<dynamic> getRequest({required String url}) async {
    try {
      final Response _respone = await _dio.get(
        url,
        options: Options(
          headers: _getRequestHeader(),
        ),
      );
      return _respone.data;
    } on DioError catch (dioError) {
      throw DioErrorException.fromDioError(dioError);
    }
  }

  Future<dynamic> postCloudinaryRequest(
      {required String url, required dynamic params}) async {
    print("url ${url}");
    print("params ${params}");
    try {
      final Response _respone = await _dio.post(
        url,
        data: params,
        options: Options(
          headers: _getCloudinaryRequestHeader(),
        ),
      );
      return _respone.data;
    } on DioError catch (dioError) {
      throw DioErrorException.fromDioError(dioError);
    }
  }

  Future<dynamic> postRequest(
      {required String url, required dynamic params}) async {
    print("url ${url}");
    print("params ${params}");
    try {
      final Response _respone = await _dio.post(
        url,
        data: params,
        options: Options(
          headers: _getRequestHeader(),
        ),
      );
      return _respone.data;
    } on DioError catch (dioError) {
      throw DioErrorException.fromDioError(dioError);
    }
  }

  Future<int> postRequestWithStatusCode(
      {required String url, required dynamic params}) async {
    try {
      final Response _respone = await _dio.post(
        url,
        data: params,
        options: Options(
          headers: _getRequestHeader(),
        ),
      );
      return _respone.statusCode ?? 400;
    } on DioError catch (dioError) {
      throw DioErrorException.fromDioError(dioError);
    }
  }

  Future<dynamic> postImageRequest({
    required String url,
    required String imageFileName,
    required String imageFilePath,
    required String folderPath,
  }) async {
    String mimeType = mime(imageFileName) ?? 'image/jpeg';
    String mimee = mimeType.split('/')[0];
    String type = mimeType.split('/')[1];
    //Dio dio = new Dio();
    // _dio.options.headers['x-api-key'] = _API_KEY;
    _dio.options.headers['Content-Type'] = "multipart/form-data";

    FormData formData = new FormData.fromMap({
      'file': await MultipartFile.fromFile(
        imageFilePath,
        filename: imageFileName,
        contentType: MediaType(mimee, type),
      ),
      'upload_preset': 'kkbfrqgs',
      'folder': folderPath
    });

    try {
      //final formData = FormData.fromMap(params);
      final Response _respone = await _dio.post(
        url,
        data: formData,
      );
      return _respone.data;
    } on DioError catch (dioError) {
      throw DioErrorException.fromDioError(dioError);
    }
  }

  Future<dynamic> deleteRequest({required String url}) async {
    try {
      final Response _respone = await _dio.delete(
        url,
        options: Options(
          headers: _getRequestHeader(),
        ),
      );
      return _respone.data;
    } on DioError catch (dioError) {
      throw DioErrorException.fromDioError(dioError);
    }
  }

  Future<int> deleteRequesWithStatusCode({required String url}) async {
    try {
      final Response _respone = await _dio.delete(
        url,
        options: Options(
          headers: _getRequestHeader(),
        ),
      );
      return _respone.statusCode ?? 400;
    } on DioError catch (dioError) {
      throw DioErrorException.fromDioError(dioError);
    }
  }
}
