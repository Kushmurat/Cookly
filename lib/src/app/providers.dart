import 'package:cookly/src/core/services/local_storage/local_storage.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../core/clients/remote/remote_client.dart';
import '../feature/auth/data/data_sources/remote/auth_remote_impl.dart';
import '../feature/auth/data/repositories/user_repository_impl.dart';
import '../feature/auth/domain/use_cases/sign_in_use_case.dart';
import '../feature/auth/domain/use_cases/sign_up_use_case.dart';
import '../feature/category/data/data_sources/remote/category_remote_impl.dart';
import '../feature/category/data/repositories/category_repository_impl.dart';
import '../feature/category/domain/use_cases/get_recipes_by_category_use_case.dart';
import 'auth_holder.dart';
import 'config.dart';

final providers = <SingleChildWidget>[
  ..._core,
  ..._clients,
  ..._services,
  ..._dataSource,
  ..._repositories,
  ..._useCases,
];

final _core = [
  Provider(
    create: (_) => LocalStorage(),
  ),
];

final _clients = [
  Provider(
    create: (context) => RemoteClient(
      baseUrl: Config.baseUrl,
      localStorage: context.read(),
    ),
  ),
];
final _services = [
  Provider(
    create: (context) => AuthHolder(
      localStorage: context.read(),
    ),
  ),
];

final _dataSource = [
  Provider(
    create: (context) => AuthRemoteImpl(context.read<RemoteClient>()),
  ),
  Provider(
    create: (context) => CategoryRemoteImpl(context.read<RemoteClient>()),
  ),
];

final _repositories = [
  Provider(
    create: (context) => UserRepositoryImpl(context.read<AuthRemoteImpl>()),
  ),
  Provider(
    create: (context) =>
        CategoryRepositoryImpl(context.read<CategoryRemoteImpl>()),
  ),
];

final _useCases = [
  Provider<SignInUseCase>(
    lazy: true,
    create: (context) => SignInUseCase(context.read<UserRepositoryImpl>()),
  ),
  Provider<SignUpUseCase>(
    lazy: true,
    create: (context) => SignUpUseCase(context.read<UserRepositoryImpl>()),
  ),
  Provider<GetRecipesByCategoryUseCase>(
    lazy: true,
    create: (context) =>
        GetRecipesByCategoryUseCase(context.read<CategoryRepositoryImpl>()),
  ),
];
