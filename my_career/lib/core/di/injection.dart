import 'package:get_it/get_it.dart';
import 'package:my_career/core/storage/local_storage_service.dart';
import 'package:my_career/features/books/data/repositories/books_repository.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDI() async {
  // Core Setup
  final localStorageService = LocalStorageServiceImpl();
  await localStorageService.init();
  getIt.registerSingleton<LocalStorageService>(localStorageService);

  // Repositories
  getIt.registerLazySingleton(() => BooksRepository(getIt()));
}
