import 'package:cookly/src/feature/auth/data/models/requests/create_user_remote_request.dart';
import 'package:cookly/src/feature/auth/data/models/responses/user_response.dart';

import '../../models/requests/sign_in_remote_request.dart';

abstract interface class IAuthRemote {
  Future<UserResponse> signIn(SignInRemoteRequest request);

  Future<void> refreshToken();

  Future<UserResponse> signUp(CreateUserRemoteRequest request);

  Future<void> signOut();
}
