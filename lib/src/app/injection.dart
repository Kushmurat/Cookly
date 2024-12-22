import 'package:cookly/config.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../core/clients/remote/remote_client.dart';
import '../core/services/local_storage/local_storage.dart';
import '../feature/auth/data/data_sources/remote/auth_remote_impl.dart';
import '../feature/auth/data/repositories/user_repository_impl.dart';
import '../feature/auth/domain/use_cases/sign_in_use_case.dart';
import '../feature/auth/domain/use_cases/sign_up_use_case.dart';
import '../feature/recipe/data/data_sourses/remote/recipe_remote_impl.dart';
import '../feature/recipe/data/repository/recipe_repository_impl.dart';
import '../feature/recipe/domain/use_cases/get_recipe_by_id_use_case.dart';
import '../feature/recipe/domain/use_cases/get_recipes_by_category_use_case.dart';
import 'auth_holder.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  // Регистрация зависимостей
  getIt.registerSingleton<LocalStorage>(LocalStorage());
  await getIt<LocalStorage>().init();
  getIt.registerLazySingleton<RemoteClient>(
    () => RemoteClient(
      baseUrl: Config.baseUrl,
      localStorage: getIt(),
    ),
  );
  getIt.registerLazySingleton<AuthHolder>(
    () => AuthHolder(
      localStorage: getIt(),
      client: getIt(),
    ),
  );
  getIt.registerLazySingleton<AuthRemoteImpl>(
    () => AuthRemoteImpl(getIt<RemoteClient>()),
  );
  getIt.registerLazySingleton<RecipeRemoteImpl>(
    () => RecipeRemoteImpl(getIt<RemoteClient>()),
  );
  getIt.registerLazySingleton<UserRepositoryImpl>(
    () => UserRepositoryImpl(getIt<AuthRemoteImpl>()),
  );
  getIt.registerLazySingleton<RecipeRepositoryImpl>(
    () => RecipeRepositoryImpl(getIt<RecipeRemoteImpl>()),
  );
  getIt.registerLazySingleton<SignInUseCase>(
    () => SignInUseCase(getIt<UserRepositoryImpl>()),
  );
  getIt.registerLazySingleton<SignUpUseCase>(
    () => SignUpUseCase(getIt<UserRepositoryImpl>()),
  );

  getIt.registerLazySingleton<GetRecipeByIdUseCase>(
    () => GetRecipeByIdUseCase(getIt<RecipeRepositoryImpl>()),
  );
  getIt.registerLazySingleton<GetRecipesByCategoryUseCase>(
    () => GetRecipesByCategoryUseCase(getIt<RecipeRepositoryImpl>()),
  );

  // Инициализация LocalStorage
  await getIt<LocalStorage>().init();
}
