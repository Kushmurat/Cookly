import 'package:cookly/src/feature/auth/domain/entities/requests/create_user_request.dart';
import 'package:cookly/src/feature/auth/domain/entities/user.entity.dart';

import '../entities/requests/sing_in_request.dart';

abstract class IUserRepository {
  Future<User> signIn(SingInRequest request);

  Future<User> signUp(CreateUserRequest request);
}
