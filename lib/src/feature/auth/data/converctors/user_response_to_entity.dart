import 'package:cookly/src/feature/auth/data/models/responses/user_response.dart';
import 'package:cookly/src/feature/auth/domain/entities/user.entity.dart';

class UserResponseToEntity {
  static User map(UserResponse from) {
    return User(
      id: from.id,
      username: from.username,
      email: from.email,
      avatarUrl: from.avatarUrl,
    );
  }
}
