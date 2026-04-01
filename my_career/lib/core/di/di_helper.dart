import 'package:get_it/get_it.dart';

class DIHelper {
  DIHelper._();

  static void registerFeature<
    Api extends Object,
    Repo extends Object,
    CubitType extends Object
  >({
    required GetIt locator,
    required Api Function() apiBuilder,
    required Repo Function(Api api) repoBuilder,
    required CubitType Function(GetIt sl) cubitBuilder,
  }) {
    if (!locator.isRegistered<Api>()) {
      locator.registerLazySingleton<Api>(apiBuilder);
    }

    if (!locator.isRegistered<Repo>()) {
      locator.registerLazySingleton<Repo>(() => repoBuilder(locator<Api>()));
    }
    if (!locator.isRegistered<CubitType>()) {
      locator.registerFactory<CubitType>(() => cubitBuilder(locator));
    }
  }

  static void registerUseCase<T extends Object>(
    GetIt locator,
    T Function() builder,
  ) {
    if (!locator.isRegistered<T>()) {
      locator.registerLazySingleton<T>(builder);
    }
  }

  static void registerService<T extends Object>(
    GetIt locator,
    T Function() factory, {
    bool isSingleton = true,
  }) {
    if (!locator.isRegistered<T>()) {
      if (isSingleton) {
        locator.registerLazySingleton<T>(factory);
      } else {
        locator.registerFactory<T>(factory);
      }
    }
  }
}
