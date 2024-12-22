import 'package:cookly/src/feature/auth/domain/entities/requests/sing_in_request.dart';
import 'package:cookly/src/feature/auth/domain/entities/user.entity.dart';
import 'package:injectable/injectable.dart';
import '../../data/repositories/user_repository_impl.dart';
import '../repositories/i_user_repository.dart';


class SignInUseCase {
  SignInUseCase(this.repository);

  final IUserRepository repository;

  Future<User> execute(SingInRequest request) {
    return repository.signIn(request);
  }
}
