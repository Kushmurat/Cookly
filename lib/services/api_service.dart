import 'dart:convert';
import 'package:http/http.dart' as dio;

Future<dio.Response?> loginUser(String email, String password) async {
  print('wow email: $email');
  print('wow pas: $password');
  try {
    final response = await dio.post(
      Uri.parse('https://cookly-andas-decode.vercel.app/login/'), // Укажите реальный URL для входа
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'username': email, 'password': password}),
    );

    if (response.statusCode == 200) {
      // Успешный запрос
      return response;
    } else {
      // Ошибка с кодом о
      print('Ошибка: ${response.body}');
      return null;
    }
  } catch (e) {
    // Ошибка сети или другая ошибка
    print('Ошибка подключения: $e');
    return null;
  }
}
Future<dio.Response?> registerUser(String email, String username, String password) async {
  try {
    print('wow email: $email');
    final response = await dio.post(
      Uri.parse('https://cookly-andas-decode.vercel.app/register/'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({'email': email, 'username': email, 'password': password}),
    );

    print('wow response: ${response.statusCode}');

    if (response.statusCode == 200) {
      // Успешный запрос
      print('wow 200');
      return response;
    } else {
      // Ошибка с кодом от сервера
      print('Ошибка: ${response.body}');
      return null;
    }
  } catch (e) {
    // Ошибка сети или другая ошибка
    print('Ошибка подключения: $e');
    return null;
  }
}