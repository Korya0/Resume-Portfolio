import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'app_routes.dart';

final GlobalKey<NavigatorState> _rootNavigatorKey = GlobalKey<NavigatorState>();
final GlobalKey<NavigatorState> _shellNavigatorKey = GlobalKey<NavigatorState>();

final appRouter = GoRouter(
  navigatorKey: _rootNavigatorKey,
  initialLocation: AppRoutes.roadmap,
  routes: [
    ShellRoute(
      navigatorKey: _shellNavigatorKey,
      builder: (context, state, child) {
        // Dummy shell until Phase 5
        return Scaffold(
          appBar: AppBar(title: const Text('Dummy Shell')),
          body: child,
          bottomNavigationBar: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Roadmap'),
              BottomNavigationBarItem(icon: Icon(Icons.book), label: 'Books'),
            ],
          ),
        );
      },
      routes: [
        GoRoute(
          path: AppRoutes.roadmap,
          builder: (context, state) => const Center(child: Text('Roadmap Page')),
        ),
        GoRoute(
          path: AppRoutes.books,
          builder: (context, state) => const Center(child: Text('Books Page')),
        ),
        GoRoute(
          path: AppRoutes.tips,
          builder: (context, state) => const Center(child: Text('Tips Page')),
        ),
        GoRoute(
          path: AppRoutes.problems,
          builder: (context, state) => const Center(child: Text('Problems Page')),
        ),
        GoRoute(
          path: AppRoutes.notes,
          builder: (context, state) => const Center(child: Text('Notes Page')),
        ),
        GoRoute(
          path: AppRoutes.cvCompare,
          builder: (context, state) => const Center(child: Text('CV Compare Page')),
        ),
        GoRoute(
          path: AppRoutes.settings,
          builder: (context, state) => const Center(child: Text('Settings Page')),
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) =>
      const Scaffold(body: Center(child: Text('Something went wrong!'))),
);
