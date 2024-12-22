import 'dart:convert';
import 'dart:developer';

import 'package:cookly/src/feature/auth/data/models/requests/create_user_remote_request.dart';
import 'package:cookly/src/feature/auth/data/models/requests/sign_in_remote_request.dart';
import 'package:cookly/src/feature/auth/data/models/responses/auth.dart';
import 'package:cookly/src/feature/auth/data/models/responses/user_response.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/clients/remote/remote_client.dart';
import 'i_auth_remote.dart';

class AuthRemoteImpl implements IAuthRemote {
  AuthRemoteImpl(this.remote);

  final RemoteClient remote;

  @override
  Future<UserResponse> signIn(SignInRemoteRequest request) async {
    try {
      final data = jsonEncode(request.toJson());
      final response = await remote.post('/login/', data: data);
      final json = response.data;

      final Auth auth = Auth.fromJson(json);

      remote.setToken(auth.access);
      remote.setRefresh(auth.refresh);

      final userResponse = auth.user;
      return userResponse;
    } catch (error, stackTrace) {
      log(
        'signIn error: $error, stackTrace: $stackTrace',
        name: 'UserRemoteImpl',
      );
      rethrow;
    }
  }

  @override
  Future<UserResponse> signUp(CreateUserRemoteRequest request) async {
    try {
      final data = jsonEncode(request.toJson());
      final response = await remote.post('/register/', data: data);
      final userResponse = UserResponse.fromJson(response.data);
      return userResponse;
    } catch (error, stackTrace) {
      log(
        'signUp error: $error, stackTrace: $stackTrace',
        name: 'UserRemoteImpl',
      );
      rethrow;
    }
  }

  @override
  Future<void> signOut() {
    // TODO: implement signOut
    throw UnimplementedError();
  }

  @override
  Future<void> refreshToken() {
    // TODO: implement refreshToken
    throw UnimplementedError();
  }
}
