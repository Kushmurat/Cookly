import 'dart:convert';

import 'package:cookly/src/core/services/local_storage/local_storage.dart';
import 'package:dio/dio.dart';

class RemoteClient {
  RemoteClient({
    required this.baseUrl,
    required this.localStorage,
  }) {
    _dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      },
    ));

    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      error: true,
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onError: (DioException e, handler) async {
        if (e.response?.statusCode == 401) {
          final newToken = await refreshAuthToken();
          setToken(newToken);

          final opts = e.requestOptions;
          opts.headers[headerAuth] = 'Bearer $newToken';

          final cloneReq = await _dio.request(
            opts.path,
            options: Options(
              method: opts.method,
              headers: opts.headers,
            ),
            data: opts.data,
            queryParameters: opts.queryParameters,
          );
          return handler.resolve(cloneReq);
        }

        return handler.next(e);
      },
    ));
  }

  final String baseUrl;
  late Dio _dio;
  final LocalStorage localStorage;
  static const headerAuth = 'Authorization';
  static const accessLocalStorageKey = 'access';
  static const refreshLocalStorageKey = 'refresh';

  initialize() async {
    final accessToken = localStorage.getString(accessLocalStorageKey);
    if (accessToken != null) {
      setToken(accessToken);
    }
  }

  void setToken(String token) {
    _dio.options.headers[headerAuth] = 'Bearer $token';
  }

  Future<Response> get(String path) async {
    try {
      return await _dio.get(path);
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(String path, {String? data}) async {
    try {
      return await _dio.post(path, data: data);
    } catch (e) {
      rethrow;
    }
  }

  Future<String> refreshAuthToken() async {
    final refreshToken = localStorage.getString(refreshLocalStorageKey);
    final data = {'refresh': refreshToken};
    final response = await post(
      '/token/refresh/',
      data: jsonEncode(data),
    );
    if (response.statusCode == 201) {
      final access = response.data['access'];
      final refresh = response.data['refresh'];
      localStorage.putString(refreshLocalStorageKey, refresh);
      return access;
    }
    return '';
  }
}
