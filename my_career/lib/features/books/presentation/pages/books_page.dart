import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/extensions/build_context_extension.dart';
import '../../../../core/common_widgets/app_modal.dart';
import '../../../../core/common_widgets/app_form_field.dart';
import '../../../../core/constants/app_constants.dart';
import '../../domain/entities/book.dart';
import '../cubit/books_cubit.dart';
import '../widgets/book_card.dart';

class BooksPage extends StatelessWidget {
  const BooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: context.read<BooksCubit>()..loadBooks(),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        floatingActionButton: FloatingActionButton(
          backgroundColor: context.colors.accent,
          onPressed: () => _showAddBookModal(context),
          child: const Icon(Icons.add, color: Colors.black),
        ),
        body: BlocBuilder<BooksCubit, BooksState>(
          builder: (context, state) {
            if (state is BooksLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (state is BooksLoaded) {
              if (state.books.isEmpty) {
                return Center(
                  child: Text(
                    AppStrings.noBooksFoundLabel,
                    style: context.typography.font14W400Color.copyWith(color: context.colors.muted),
                  ),
                );
              }

              return GridView.builder(
                padding: const EdgeInsets.all(LayoutConstants.defaultPadding),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: context.isMobile ? 2 : 4,
                  crossAxisSpacing: LayoutConstants.gridSpacing,
                  mainAxisSpacing: LayoutConstants.gridSpacing,
                  childAspectRatio: LayoutConstants.bookCardAspectRatio,
                ),
                itemCount: state.books.length,
                itemBuilder: (context, index) {
                  final book = state.books[index];
                  return BookCard(
                    book: book,
                    onDelete: () => context.read<BooksCubit>().deleteBook(book.id),
                  );
                },
              );
            }

            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }

  void _showAddBookModal(BuildContext context) {
    final titleController = TextEditingController();
    final authorController = TextEditingController();
    final noteController = TextEditingController();

    AppModal.show(
      context: context,
      title: AppStrings.addBookTitle,
      content: Column(
        children: [
          AppFormField(label: "Book Title", controller: titleController),
          const SizedBox(height: 16),
          AppFormField(label: "Author", controller: authorController),
          const SizedBox(height: 16),
          AppFormField(label: "Note/Description", controller: noteController),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text("Cancel", style: TextStyle(color: context.colors.muted)),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: context.colors.accent),
          onPressed: () {
            final book = Book(
              id: DateTime.now().millisecondsSinceEpoch.toString(),
              title: titleController.text,
              author: authorController.text,
              note: noteController.text,
            );
            context.read<BooksCubit>().addBook(book);
            Navigator.pop(context);
          },
          child: const Text("Save"),
        ),
      ],
    );
  }
}
