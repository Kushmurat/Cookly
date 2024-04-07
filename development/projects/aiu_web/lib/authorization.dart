import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:const Color(0xFFF5F5F5),
      body: Padding(
        padding: const EdgeInsets.only(top: 130,left: 35,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Авторизация',
              style: TextStyle(
                color: Color(0xFF2E5BB1),
                fontSize: 41,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 40),
            Container(
              width: 356,
              height: 447,
              decoration:  BoxDecoration(
                color: Colors.white,
                borderRadius:  BorderRadius.circular(35),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 26,),
                  const Text(
                    'ID или Email адрес',
                    style: TextStyle(
                      color: Color(0xFF343434),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 21,),
                  Container(
                    width: 310,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xFFECECEC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 55),
                  const Text(
                    'Пaроль',
                    style: TextStyle(
                      color: Color(0xFF343434),
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 21),
                  Container(
                    width: 310,
                    height: 55,
                    decoration: BoxDecoration(
                      color: const Color(0xFFECECEC),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const TextField(
                      obscureText: true,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      ),
                    ),
                  ),
                  const SizedBox(height: 33),
                  const Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(right: 40),
                      child: Text(
                        'Забыли пароль?',
                        style: TextStyle(
                          color: Color(0xFF888888),
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 40),
                  SizedBox(
                    width: 322,
                    height: 55,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2E5BB1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Войти',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight:FontWeight.w600,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(height: 32),
            TextButton(onPressed: () {
              Navigator.pushNamed(context, '/FirstPage');
            },
            child: const Text('Регистрация',
              style: TextStyle(
                color: Color(0xFF2E5BB1),
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            )
            )
          ],
        ),
      ),
    );
  }
}
