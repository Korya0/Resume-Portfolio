import 'package:flutter/material.dart';
import '../../../../core/utils/extensions/build_context_extension.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/router/app_routes.dart';
import '../../domain/entities/sidebar_link.dart';
import 'sidebar_link_item.dart';

class Sidebar extends StatelessWidget {
  final String currentPath;
  final List<SidebarLink> links;
  final bool isLoading;

  const Sidebar({
    super.key,
    required this.currentPath,
    required this.links,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: AppConstants.sidebarWidth,
      decoration: BoxDecoration(
        color: context.colors.surface,
        border: Border(right: BorderSide(color: context.colors.border, width: 1)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: context.colors.accent.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: const Text("🚀", style: TextStyle(fontSize: 24)),
                ),
                const SizedBox(width: 12),
                const Text(
                  AppConstants.appTitle,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator(color: context.colors.accent))
                : ListView.builder(
                    itemCount: links.length,
                    itemBuilder: (context, index) {
                      final link = links[index];
                      return SidebarLinkItem(
                        title: link.title,
                        path: link.path,
                        emoji: link.emoji,
                        isSelected: currentPath == link.path,
                      );
                    },
                  ),
          ),
          const Divider(height: 1, indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: SidebarLinkItem(
              title: "Settings",
              path: AppRoutes.settings,
              emoji: "⚙️",
              isSelected: currentPath == AppRoutes.settings,
            ),
          ),
        ],
      ),
    );
  }
}
