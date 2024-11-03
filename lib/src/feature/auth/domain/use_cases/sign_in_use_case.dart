import 'package:cookly/src/feature/auth/domain/entities/requests/sing_in_request.dart';
import 'package:cookly/src/feature/auth/domain/entities/user.entity.dart';
import '../../data/repositories/user_repository_impl.dart';

class SignInUseCase {
  SignInUseCase(this.repository);

  final UserRepositoryImpl repository;

  Future<User> execute(SingInRequest request) {
    return repository.signIn(request);
  }
}
