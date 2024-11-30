import 'dart:convert';
import 'package:dio/dio.dart';

class ApiService {
  static const String _apiKey = 'key';
  static const String _baseUrl = '';

  // Создаём Dio с базовыми настройками
  static final Dio _dio = Dio(BaseOptions(
    baseUrl: _baseUrl,
    headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $_apiKey',
    },
    connectTimeout: const Duration(seconds: 10), // 10 секунд
    receiveTimeout: const Duration(seconds: 10), // 10 секунд
  ))
    ..interceptors.add(LogInterceptor(
      request: true,
      responseBody: true,
      error: true,
    ));

  /// Отправляет сообщение с историей сообщений и обрабатывает ответ
  static Future<String> sendMessageWithHistory(
      List<Map<String, String>> messages,
      {int retries = 3}) async {
    try {
      final response = await _dio.post(
        '',
        data: jsonEncode({
          'model': 'gpt-3.5-turbo',
          'messages': messages,
        }),
      );

      if (response.statusCode == 200) {
        return response.data['choices'][0]['message']['content'].trim();
      } else {
        throw Exception(
            'Ошибка API: ${response.statusCode} ${response.statusMessage}');
      }
    } on DioError catch (e) {
      if (e.response?.statusCode == 429 && retries > 0) {
        // Обработка Rate Limiting
        await Future.delayed(const Duration(seconds: 5)); // Задержка 5 секунд
        return sendMessageWithHistory(messages, retries: retries - 1);
      }
      return 'Произошла ошибка: ${e.message}';
    } catch (e) {
      return 'Произошла ошибка: $e';
    }
  }
}
