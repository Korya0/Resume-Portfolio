import 'package:flutter/material.dart';

import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class MyCareerApp extends StatelessWidget {
  const MyCareerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'My Career Roadmap',
      theme: AppTheme.darkTheme,
      routerConfig: appRouter,
    );
  }
}
