import 'dart:developer';

import 'package:flutter/material.dart';

import '../core/services/local_storage/local_storage.dart';
import '../feature/auth/domain/entities/user.entity.dart';

enum AuthState {
  unknown,
  authorized,
  unauthorized,
}

class AuthHolder {
  AuthHolder({
    required this.localStorage,
  }) {
    initialize();
  }

  final LocalStorage localStorage;

  static const String isAuthorizedLocalStorageKey = 'is_authorized';

  bool get isAuthorized => authState == AuthState.authorized;

  bool get isUnauthorized => authState == AuthState.unauthorized;

  AuthState get authState => _authState;
  AuthState _authState = AuthState.unknown;

  String? refreshToken;

  User? get user => _user;
  User? _user;

  Future<void> initialize() async {
    log('wow authHolder initialize');
    await localStorage.init();
    log('wow localStorage initialized');
    final isAuthorized = localStorage.getBool(isAuthorizedLocalStorageKey);
    if (isAuthorized) {
      _authState = AuthState.authorized;
      return;
    }
    _authState = AuthState.unauthorized;
    log('wow authHolder setToken');
  }

  Future<void> authorized(User user) {
    _user = user;
    return localStorage.putBool(isAuthorizedLocalStorageKey, true);
  }

  Future<void> logout() {
    _user = null;
    return localStorage.putBool(isAuthorizedLocalStorageKey, false);
  }
}
