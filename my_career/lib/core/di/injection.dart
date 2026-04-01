import 'package:get_it/get_it.dart';
import '../../features/books/data/repositories/books_repository.dart';
import '../../features/shell/data/repositories/sidebar_repository.dart';
import '../../features/shell/presentation/cubit/shell_cubit.dart';
import '../../features/roadmap/data/repositories/roadmap_repository.dart';
import '../../features/roadmap/presentation/cubit/roadmap_cubit.dart';
import '../../features/books/presentation/cubit/books_cubit.dart';
import '../../features/tips/data/repositories/tips_repository.dart';
import '../../features/problems/data/repositories/problems_repository.dart';
import '../../features/notes/data/repositories/notes_repository.dart';
import '../storage/local_storage_service.dart';

final GetIt getIt = GetIt.instance;

Future<void> initDI() async {
  // Core Setup
  final localStorageService = LocalStorageServiceImpl();
  await localStorageService.init();
  getIt.registerLazySingleton<LocalStorageService>(() => localStorageService);

  // Repositories
  getIt.registerLazySingleton(() => BooksRepository(getIt()));
  getIt.registerLazySingleton(() => SidebarRepository(getIt()));
  getIt.registerLazySingleton(() => RoadmapRepository(getIt()));
  getIt.registerLazySingleton(() => TipsRepository(getIt()));
  getIt.registerLazySingleton(() => ProblemsRepository(getIt()));
  getIt.registerLazySingleton(() => NotesRepository(getIt()));

  // Cubits
  getIt.registerFactory(() => ShellCubit(getIt<SidebarRepository>()));
  getIt.registerSingleton(() => RoadmapCubit(getIt<RoadmapRepository>()));
  getIt.registerSingleton(() => BooksCubit(getIt<BooksRepository>()));
}
