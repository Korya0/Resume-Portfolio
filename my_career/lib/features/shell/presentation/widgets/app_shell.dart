import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/extensions/build_context_extension.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/di/injection.dart';
import '../cubit/shell_cubit.dart';
import '../../domain/entities/sidebar_link.dart';
import 'sidebar.dart';
import 'top_nav_bar.dart';

class AppShell extends StatelessWidget {
  final Widget child;
  final String currentPath;

  const AppShell({
    super.key,
    required this.child,
    required this.currentPath,
  });

  String _getTitle(String path) {
    if (path.contains(AppRoutes.roadmap)) return AppConstants.roadmapTitle;
    if (path.contains(AppRoutes.books)) return AppConstants.booksTitle;
    if (path.contains(AppRoutes.tips)) return AppConstants.tipsTitle;
    if (path.contains(AppRoutes.problems)) return AppConstants.problemsTitle;
    if (path.contains(AppRoutes.notes)) return AppConstants.notesTitle;
    if (path.contains(AppRoutes.cvCompare)) return AppConstants.cvCompareTitle;
    if (path.contains(AppRoutes.settings)) return AppConstants.settingsTitle;
    return AppConstants.appTitle;
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ShellCubit>()..loadLinks(),
      child: BlocBuilder<ShellCubit, ShellState>(
        builder: (context, state) {
          final List<SidebarLink> links = (state is ShellLoaded) ? state.links : [];
          final isLoading = state is ShellLoading;
          final title = _getTitle(currentPath);

          // Mobile Layout (Drawer)
          if (context.isMobile) {
            return Scaffold(
              backgroundColor: context.colors.background,
              appBar: AppBar(
                title: Text(
                  title,
                  style: context.typography.titleMedium.copyWith(fontSize: 18),
                ),
                backgroundColor: context.colors.background.withValues(alpha: 0.8),
                centerTitle: true,
                elevation: 0,
                leading: Builder(
                  builder: (context) => IconButton(
                    icon: Icon(Icons.menu, color: context.colors.accent),
                    onPressed: () => Scaffold.of(context).openDrawer(),
                  ),
                ),
              ),
              drawer: Drawer(
                width: AppConstants.sidebarWidth,
                backgroundColor: context.colors.surface,
                child: Sidebar(
                  currentPath: currentPath,
                  links: links,
                  isLoading: isLoading,
                ),
              ),
              body: child,
            );
          }

          // Desktop/Tablet Layout (Permanent Sidebar)
          return Scaffold(
            backgroundColor: context.colors.background,
            body: Row(
              children: [
                Sidebar(
                  currentPath: currentPath,
                  links: links,
                  isLoading: isLoading,
                ),
                Expanded(
                  child: Column(
                    children: [
                      TopNavBar(title: title),
                      Expanded(
                        child: ClipRect(
                          child: child,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
