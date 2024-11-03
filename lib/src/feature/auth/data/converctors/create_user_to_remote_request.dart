import 'package:cookly/src/feature/auth/data/models/requests/create_user_remote_request.dart';
import 'package:cookly/src/feature/auth/domain/entities/requests/create_user_request.dart';

class CreateUserToRemoteRequest {
  static CreateUserRemoteRequest map(CreateUserRequest from){
    return CreateUserRemoteRequest(
      userName: from.userName,
      email: from.email,
      password: from.password,
    );
  }
}