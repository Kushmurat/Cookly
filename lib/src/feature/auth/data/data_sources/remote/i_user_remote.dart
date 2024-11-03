import 'package:cookly/src/feature/auth/data/models/requests/create_user_remote_request.dart';
import 'package:cookly/src/feature/auth/data/models/responses/user_response.dart';

import '../../models/requests/sign_in_remote_request.dart';

abstract class IUserRemote {
  Future<UserResponse> signIn(SignInRemoteRequest request);

  Future<UserResponse> signUp(CreateUserRemoteRequest request);
}
