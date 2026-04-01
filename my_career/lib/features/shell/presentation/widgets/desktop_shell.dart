import 'package:flutter/material.dart';
import '../../../../core/utils/extensions/build_context_extension.dart';
import 'sidebar.dart';
import 'top_nav_bar.dart';

class DesktopShell extends StatelessWidget {
  final String title;
  final String currentPath;
  final List<dynamic> links;
  final bool isLoading;
  final Widget child;

  const DesktopShell({
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
      body: Row(
        children: [
          Sidebar(
            currentPath: currentPath,
            links: links.cast(),
            isLoading: isLoading,
          ),
          Expanded(
            child: Column(
              children: [
                TopNavBar(title: title),
                Expanded(child: ClipRect(child: child)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
