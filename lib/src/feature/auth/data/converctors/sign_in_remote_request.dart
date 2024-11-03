import 'package:cookly/src/feature/auth/data/models/requests/create_user_remote_request.dart';
import 'package:cookly/src/feature/auth/data/models/requests/sign_in_remote_request.dart';
import 'package:cookly/src/feature/auth/domain/entities/requests/create_user_request.dart';
import 'package:cookly/src/feature/auth/domain/entities/requests/sing_in_request.dart';

class SignInToRemoteRequest {
  static SignInRemoteRequest map(SingInRequest from) {
    return SignInRemoteRequest(
      userName: from.userName,
      password: from.password,
    );
  }
}
