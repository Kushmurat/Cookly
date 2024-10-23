import 'package:flutter/material.dart';

class AuthScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Заголовок "Авторизация"
                Text(
                  'Авторизация',
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.orange,
                  ),
                ),
                SizedBox(height: 14),
                // Карточка с формой
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(0, 130, 0, 69),
                    child: Column(
                      children: [
                        // Поле ввода ID или Email
                        Text('ID или Email адрес',
                          style:TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w200,
                          ),
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(9),
                              borderSide: BorderSide(
                                color: Colors.white,
                              )
                            ),
                          ),
                        ),
                        SizedBox(height: 37),
                        // Поле ввода пароля
                        Text('Пароль',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w100,
                          ),
                        ),
                        TextFormField(
                          obscureText: true, // Скрытие символов пароля
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.visibility),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Ссылка "Забыли пароль?"
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {},
                            child: Text('Забыли пароль?',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w100,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        // Кнопка "Войти"
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                           backgroundColor : Colors.orange, // Цвет кнопки
                            padding: EdgeInsets.symmetric(
                                horizontal: 100, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Войти',
                            style: TextStyle(fontSize: 18),
                          ),
                        ),
                        SizedBox(height: 10),
                        // Checkbox "Запомнить меня"
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Checkbox(value: false, onChanged: (value) {}),
                            Text('Запомнить меня'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                // Нижняя часть: текст "Нет персонального аккаунта?"
                Text('Нет персонального аккаунта?'),
                TextButton(
                  onPressed: () {
                    // Действие на регистрацию
                  },
                  child: Text(
                    'Регистрация',
                    style: TextStyle(
                      color: Colors.orange,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),

        ),
      ),
    );
  }
}

