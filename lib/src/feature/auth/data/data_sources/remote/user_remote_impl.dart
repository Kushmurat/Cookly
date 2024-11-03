import 'dart:convert';
import 'dart:developer';

import 'package:cookly/src/core/http/http.dart';
import 'package:cookly/src/feature/auth/data/models/requests/create_user_remote_request.dart';
import 'package:cookly/src/feature/auth/data/models/requests/sign_in_remote_request.dart';
import 'package:cookly/src/feature/auth/data/models/responses/user_response.dart';

import 'i_user_remote.dart';

class UserRemoteImpl extends IUserRemote {
  UserRemoteImpl(this.http);

  final Http http;

  @override
  Future<UserResponse> signIn(SignInRemoteRequest request) async {
    try {
      final data = jsonEncode(request.toJson());
      final response = await http.post('/login/', data);
      final userJson = response.data['user'];
      final userResponse = UserResponse.fromJson(userJson);
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
      final response = await http.post('/register/', data);
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
}
