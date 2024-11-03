import 'dart:developer';

import 'package:cookly/src/feature/auth/domain/entities/user.entity.dart';
import 'package:cookly/src/feature/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/requests/sing_in_request.dart';

class SignInController extends ChangeNotifier {
  SignInController(this._signInUseCase);

  final SignInUseCase _signInUseCase;

  User? currentUser;

  Future<void> signIn(String userName, String password) async {
    try {
      final request = SingInRequest(
        userName: userName,
        password: password,
      );
      final user = await _signInUseCase.execute(request);
      currentUser = user;
      notifyListeners();
      log('Success signIn: ${user.userName}', name: 'SignInController');
    } catch (error, stackTrace) {
      log(
        'signIn width: $userName, $password error: $error, stackTrace: $stackTrace',
        name: 'SignInController',
      );
    }
  }
}
