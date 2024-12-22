import 'dart:developer';

import 'package:cookly/src/feature/auth/domain/entities/requests/create_user_request.dart';
import 'package:cookly/src/feature/auth/domain/entities/requests/sing_in_request.dart';
import 'package:cookly/src/feature/auth/domain/entities/user.entity.dart';
import 'package:cookly/src/feature/auth/domain/repositories/i_user_repository.dart';
import 'package:injectable/injectable.dart';

import '../converctors/create_user_to_remote_request.dart';
import '../converctors/sign_in_remote_request.dart';
import '../converctors/user_response_to_entity.dart';
import '../data_sources/remote/i_auth_remote.dart';

class UserRepositoryImpl extends IUserRepository {
  UserRepositoryImpl(this.remote);

  final IAuthRemote remote;

  @override
  Future<User> signIn(SingInRequest request) async {
    try {
      final remoteRequest = SignInToRemoteRequest.map(request);
      final response = await remote.signIn(remoteRequest);
      final user = UserResponseToEntity.map(response);
      return user;
    } catch (error, stackTrace) {
      log(
        'signIn error: $error, stackTrace: $stackTrace',
        name: 'UserRepositoryImpl',
      );
      rethrow;
    }
  }

  @override
  Future<User> signUp(CreateUserRequest request) async {
    try {
      final remoteRequest = CreateUserToRemoteRequest.map(request);
      final response = await remote.signUp(remoteRequest);
      final user = UserResponseToEntity.map(response);
      return user;
    } catch (error, stackTrace) {
      log(
        'signUp error: $error, stackTrace: $stackTrace',
        name: 'UserRepositoryImpl',
      );
      rethrow;
    }
  }
}
