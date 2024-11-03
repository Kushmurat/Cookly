import 'dart:developer';

import 'package:dio/dio.dart';

class Http {
  Http(this.baseUrl) {
    _init();
  }

  final String baseUrl;
  late final Dio _dio;

  void _init() {
    _dio = Dio(BaseOptions(baseUrl: baseUrl));
  }

  Future<Response> get(
    String path,
    Map<String, dynamic> queryParameters,
  ) async {
    try {
      log('GET: $baseUrl$path');
      log('query: $queryParameters');
      final response = await _dio.get(
        path,
        queryParameters: queryParameters,
      );
      log('GET: ${response.data}');
      return response;
    } catch (error, stackTrace) {
      log('Http, $path error: $error, stackTrace: $stackTrace', name: 'GET');
      rethrow;
    }
  }

  Future<Response> post(
    String path,
    String data,
  ) async {
    try {
      log('POST: $baseUrl$path');
      log('data: $data');
      final response = await _dio.post(
        path,
        data: data,
      );
      log('POST: ${response.data}');
      return response;
    } catch (error, stackTrace) {
      log('Http, $path error: $error, stackTrace: $stackTrace', name: 'POST');
      rethrow;
    }
  }
}
