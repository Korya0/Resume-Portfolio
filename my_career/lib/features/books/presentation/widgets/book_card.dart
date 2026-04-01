import 'package:flutter/material.dart';
import '../../../../core/utils/extensions/build_context_extension.dart';
import '../../../../core/common_widgets/app_card.dart';
import '../../domain/entities/book.dart';

class BookCard extends StatelessWidget {
  final Book book;
  final VoidCallback onDelete;

  const BookCard({super.key, required this.book, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      padding: EdgeInsets.zero,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: context.colors.surface2,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: context.colors.border),
                  ),
                  child: Center(
                    child: Icon(Icons.book, size: 48, color: context.colors.accent2),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  book.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: context.typography.bodyRegular.copyWith(fontWeight: FontWeight.bold),
                ),
                Text(
                  book.author,
                  style: context.typography.bodyRegular.copyWith(color: context.colors.muted, fontSize: 13),
                ),
                const Spacer(),
                Text(
                  book.note,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.typography.bodyRegular.copyWith(color: context.colors.accent, fontSize: 12),
                ),
              ],
            ),
          ),
          Positioned(
            top: 4,
            right: 4,
            child: IconButton(
              icon: Icon(Icons.delete, size: 18, color: context.colors.error),
              onPressed: onDelete,
            ),
          ),
        ],
      ),
    );
  }
}
