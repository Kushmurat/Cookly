import 'dart:developer';

import 'package:cookly/src/app/auth_holder.dart';
import 'package:cookly/src/core/services/local_storage/local_storage.dart';
import 'package:cookly/src/feature/auth/domain/entities/user.entity.dart';
import 'package:cookly/src/feature/auth/domain/use_cases/sign_in_use_case.dart';
import 'package:flutter/cupertino.dart';

import '../../../domain/entities/requests/sing_in_request.dart';

class SignInController extends ChangeNotifier {
  SignInController({
    required this.signInUseCase,
    required this.authHolder,
  });

  final SignInUseCase signInUseCase;
  final AuthHolder authHolder;

  bool get isLoading => _isLoading;
  bool _isLoading = false;

  Future<bool> signIn(String userName, String password) async {
    try {
      final request = SingInRequest(
        userName: userName,
        password: password,
      );
      _isLoading = true;
      notifyListeners();
      final user = await signInUseCase.execute(request);
      _isLoading = false;
      notifyListeners();
      authHolder.authorized(user);
      notifyListeners();
      log('Success signIn: ${user.username}', name: 'SignInController');

      return true;
    } catch (error, stackTrace) {
      log(
        'signIn width: $userName, $password error: $error, stackTrace: $stackTrace',
        name: 'SignInController',
      );
      _isLoading = false;
      notifyListeners();
      return false;
    }
  }
}
