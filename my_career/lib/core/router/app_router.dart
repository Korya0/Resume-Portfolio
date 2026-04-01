import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';
import '../../features/shell/presentation/widgets/app_shell.dart';
import '../../features/roadmap/presentation/pages/roadmap_page.dart';
import '../../features/books/presentation/pages/books_page.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.roadmap,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        return AppShell(
          currentPath: state.matchedLocation,
          child: child,
        );
      },
      routes: [
        GoRoute(
          path: AppRoutes.roadmap,
          builder: (context, state) => const RoadmapPage(),
        ),
        GoRoute(
          path: AppRoutes.books,
          builder: (context, state) => const BooksPage(),
        ),
        GoRoute(
          path: AppRoutes.tips,
          builder: (context, state) => const Scaffold(body: Center(child: Text("Tips Page"))),
        ),
        GoRoute(
          path: AppRoutes.problems,
          builder: (context, state) => const Scaffold(body: Center(child: Text("Problems Page"))),
        ),
        GoRoute(
          path: AppRoutes.notes,
          builder: (context, state) => const Scaffold(body: Center(child: Text("Notes Page"))),
        ),
        GoRoute(
          path: AppRoutes.cvCompare,
          builder: (context, state) => const Scaffold(body: Center(child: Text("CV Analysis Page"))),
        ),
        GoRoute(
          path: AppRoutes.settings,
          builder: (context, state) => const Scaffold(body: Center(child: Text("Settings Page"))),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) =>
      const Scaffold(body: Center(child: Text('Something went wrong!'))),
);
