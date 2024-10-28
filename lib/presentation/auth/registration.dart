import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 55),
              // Кнопка "Назад"
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  color: Colors.orange,
                  onPressed: () {
                    Navigator.pop(context); // Возвращаемся на предыдущий экран
                  },
                ),
              ),
              // Заголовок "Регистрация"
              Text(
                'Регистрация',
                style: GoogleFonts.montserrat(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.orange,
                ),
              ),
              SizedBox(height: 26),
              Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(horizontal: 17.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(35),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(23.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Поля ввода данных
                      _buildInputLabel('Имя'),
                      _buildInputField(),
                      _buildInputLabel('Фамилия'),
                      _buildInputField(),
                      _buildInputLabel('Адрес электронной почты'),
                      _buildInputField(),
                      _buildInputLabel('Номер телефона'),
                      _buildInputField(),
                      _buildInputLabel('Пароль'),
                      _buildInputField(isPassword: true),
                      _buildInputLabel('Подтверждение пароля'),
                      _buildInputField(isPassword: true),
                      SizedBox(height: 37),
                      // Кнопка "Зарегистрироваться"
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.orange,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Зарегистрироваться',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(height: 15),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text('Я принимаю условия и правила '),
              TextButton(
                onPressed: () {
                  // Действие на правила и условия
                },
                child: Text(
                  '(правила и условия)',
                  style: TextStyle(
                    color: Colors.orange,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInputLabel(String label) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        label,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget _buildInputField({bool isPassword = false}) {
    return SizedBox(
      width: double.infinity,
      height: 55,
      child: TextFormField(
        obscureText: isPassword,
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.grey[100],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(9),
            borderSide: BorderSide.none,
          ),
          contentPadding: EdgeInsets.symmetric(horizontal: 16),
          suffixIcon: isPassword ? Icon(Icons.visibility) : null,
        ),
      ),
    );
  }
}
