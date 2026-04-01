import 'package:flutter/material.dart';
import '../../../../core/utils/extensions/build_context_extension.dart';
import '../../../../core/constants/app_constants.dart';
import 'sidebar.dart';

class MobileShell extends StatelessWidget {
  final String title;
  final String currentPath;
  final List<dynamic> links; // SidebarLink
  final bool isLoading;
  final Widget child;

  const MobileShell({
    super.key,
    required this.title,
    required this.currentPath,
    required this.links,
    required this.isLoading,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.background,
      appBar: AppBar(
        title: Text(title, style: context.typography.font16W700Color),
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
        width: LayoutConstants.sidebarWidth,
        backgroundColor: context.colors.surface,
        child: Sidebar(
          currentPath: currentPath,
          links: links.cast(),
          isLoading: isLoading,
        ),
      ),
      body: child,
    );
  }
}
