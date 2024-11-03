import 'package:cookly/src/core/http/http.dart';
import 'package:cookly/src/feature/auth/data/repositories/user_repository_impl.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../feature/auth/data/data_sources/remote/user_remote_impl.dart';
import '../feature/auth/domain/use_cases/sign_in_use_case.dart';
import '../feature/auth/domain/use_cases/sign_up_use_case.dart';
import 'config.dart';

final providers = <SingleChildWidget>[
  ..._core,
  ..._dataSource,
  ..._repositories,
  ..._useCases,
];

final _core = [
  Provider(create: (_) => Http(Config.baseUrl)),
];
final _dataSource = [
  Provider(
    create: (context) => UserRemoteImpl(context.read<Http>()),
  ),
];

final _repositories = [
  Provider(
    create: (context) => UserRepositoryImpl(context.read<UserRemoteImpl>()),
  ),
];

final _useCases = [
  Provider<SignInUseCase>(
    create: (context) => SignInUseCase(context.read<UserRepositoryImpl>()),
  ),
  Provider<SignUpUseCase>(
    create: (context) => SignUpUseCase(context.read<UserRepositoryImpl>()),
  ),
];