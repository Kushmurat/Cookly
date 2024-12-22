import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../core/clients/remote/remote_client.dart';
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
    required this.client,
  }) {
    initialize();
  }

  final LocalStorage localStorage;
  final RemoteClient client;

  static const String isAuthorizedLocalStorageKey = 'is_authorized';

  bool get isAuthorized => authState == AuthState.authorized;

  bool get isUnauthorized => authState == AuthState.unauthorized;

  AuthState get authState => _authState;
  AuthState _authState = AuthState.unknown;

  String? refreshToken;

  User? get user => _user;
  User? _user;

  static const accessLocalStorageKey = 'access';
  static const refreshLocalStorageKey = 'refresh';

  Future<void> initialize() async {
    await localStorage.init();
    final isAuthorized = localStorage.getBool(isAuthorizedLocalStorageKey);
    final access = localStorage.getString(accessLocalStorageKey);
    final refresh = localStorage.getString(refreshLocalStorageKey);
    if (access != null && refresh != null) {
      client.setToken(access);
      _authState = AuthState.authorized;
      return;
    }
    _authState = AuthState.unauthorized;
  }

  Future<void> authorized(User user) {
    _user = user;
    return localStorage.putBool(isAuthorizedLocalStorageKey, true);
  }

  Future<void> logout() {
    _user = null;
    localStorage.remove(accessLocalStorageKey);
    localStorage.remove(accessLocalStorageKey);
    return localStorage.putBool(isAuthorizedLocalStorageKey, false);
  }
}
