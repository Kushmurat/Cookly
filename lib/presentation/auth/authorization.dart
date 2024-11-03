import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../services/api_service.dart';

class AuthScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        //child: Padding(
          //padding: const EdgeInsets.all(1.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Заголовок "Авторизация"
                Text(
                  'Авторизация',
                  style: GoogleFonts.montserrat(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                const SizedBox(height: 26),
                // Карточка с формой
                Card(
                  color: Colors.white,
                  margin: const EdgeInsets.symmetric(horizontal: 17.0), // Сделал симметричный отступ
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(23.0), // Более ровное внутреннее заполнение
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Поле ввода ID или Email
                        const Text(
                          'ID или Email адрес',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: TextField(
                            controller: emailController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[100],
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16),
                            ),
                          ),
                        ),
                        const SizedBox(height: 37),
                        // Поле ввода пароля
                        const Text(
                          'Пароль',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: TextField(
                            obscureText: true,
                            controller: passwordController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.grey[100], // Цвет фона текстового поля
                              suffixIcon: const Icon(Icons.visibility), // Иконка в конце поля
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(9),
                                borderSide: BorderSide.none, // Убираем видимую границу
                              ),
                              contentPadding: const EdgeInsets.symmetric(horizontal: 16), // Внутренние отступы
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        // Ссылка "Забыли пароль?"
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Забыли пароль?',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                                color: Colors.blue,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        // Кнопка "Войти"
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.orange, // Цвет кнопки
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            onPressed: () async {
                              String email = emailController.text;
                              String password = passwordController.text;

                              var response = await loginUser(email, password);
                              if (response != null) {
                                print('Ответ от сервера: ${response.body}');
                                // Проверьте содержимое `response.body`, чтобы узнать точную ошибку
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Ошибка входа')),
                                );
                              }
                            },
                            child: const Text(
                              'Войти',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 15),
                        // Checkbox "Запомнить меня"
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            const Text('Запомнить меня'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                // Нижняя часть: текст "Нет персонального аккаунта?"
                const Text('Нет персонального аккаунта?'),
                TextButton(
                  onPressed: () {
                    // Действие на регистрацию
                  },
                  child: const Text(
                    'Регистрация',
                    style: TextStyle(
                      color: Colors.orange,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
       // ),
      ),
    );
  }
}
