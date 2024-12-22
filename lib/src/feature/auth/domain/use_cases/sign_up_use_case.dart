import 'package:cookly/src/feature/auth/domain/entities/requests/create_user_request.dart';
import 'package:cookly/src/feature/auth/domain/entities/user.entity.dart';
import 'package:injectable/injectable.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../repositories/i_user_repository.dart';
class SignUpUseCase {
  SignUpUseCase(this.repository);

  final IUserRepository repository;

  Future<User> execute(CreateUserRequest request) {
    return repository.signUp(request);
  }
}
