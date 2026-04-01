import 'package:get_it/get_it.dart';
import 'package:my_career/core/storage/local_storage_service.dart';
import 'package:my_career/features/books/data/repositories/books_repository.dart';
import 'package:my_career/features/shell/data/repositories/sidebar_repository.dart';
import 'package:my_career/features/roadmap/data/repositories/roadmap_repository.dart';
import 'package:my_career/features/tips/data/repositories/tips_repository.dart';
import 'package:my_career/features/problems/data/repositories/problems_repository.dart';
import 'package:my_career/features/notes/data/repositories/notes_repository.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDI() async {
  // Core Setup
  final localStorageService = LocalStorageServiceImpl();
  await localStorageService.init();
  getIt.registerSingleton<LocalStorageService>(localStorageService);

  // Repositories
  getIt.registerLazySingleton(() => BooksRepository(getIt()));
  getIt.registerLazySingleton(() => SidebarRepository(getIt()));
  getIt.registerLazySingleton(() => RoadmapRepository(getIt()));
  getIt.registerLazySingleton(() => TipsRepository(getIt()));
  getIt.registerLazySingleton(() => ProblemsRepository(getIt()));
  getIt.registerLazySingleton(() => NotesRepository(getIt()));
}
