import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/extensions/build_context_extension.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/di/injection.dart';
import '../cubit/shell_cubit.dart';
import '../../domain/entities/sidebar_link.dart';
import 'mobile_shell.dart';
import 'desktop_shell.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  final String currentPath;

  const AppShell({super.key, required this.child, required this.currentPath});

  String _getTitle(String path) {
    if (path.contains(AppRoutes.roadmap)) return AppStrings.roadmapTitle;
    if (path.contains(AppRoutes.books)) return AppStrings.booksTitle;
    if (path.contains(AppRoutes.tips)) return AppStrings.tipsTitle;
    if (path.contains(AppRoutes.problems)) return AppStrings.problemsTitle;
    if (path.contains(AppRoutes.notes)) return AppStrings.notesTitle;
    if (path.contains(AppRoutes.cvCompare)) return AppStrings.cvCompareTitle;
    if (path.contains(AppRoutes.settings)) return AppStrings.settingsTitle;
    return AppStrings.appTitle;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShellCubit>()..loadLinks(),
      child: BlocBuilder<ShellCubit, ShellState>(
        builder: (context, state) {
          final List<SidebarLink> links = (state is ShellLoaded) ? state.links : [];
          final bool isLoading = state is ShellLoading;
          final String title = _getTitle(currentPath);

          if (context.isMobile) {
            return MobileShell(
              title: title,
              currentPath: currentPath,
              links: links,
              isLoading: isLoading,
              child: child,
            );
          }

          return DesktopShell(
            title: title,
            currentPath: currentPath,
            links: links,
            isLoading: isLoading,
            child: child,
          );
        },
      ),
    );
  }
}
