import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/book.dart';
import '../../data/repositories/books_repository.dart';

abstract class BooksState {}

class BooksInitial extends BooksState {}
class BooksLoading extends BooksState {}
class BooksLoaded extends BooksState {
  final List<Book> books;
  BooksLoaded(this.books);
}
class BooksError extends BooksState {
  final String message;
  BooksError(this.message);
}

class BooksCubit extends Cubit<BooksState> {
  final BooksRepository _repository;

  BooksCubit(this._repository) : super(BooksInitial());

  Future<void> loadBooks() async {
    emit(BooksLoading());
    try {
      final books = await _repository.getBooks();
      emit(BooksLoaded(books));
    } catch (e) {
      emit(BooksError(e.toString()));
    }
  }

  Future<void> addBook(Book book) async {
    if (state is! BooksLoaded) return;
    final currentBooks = List<Book>.from((state as BooksLoaded).books);
    currentBooks.add(book);
    await _repository.saveBooks(currentBooks);
    emit(BooksLoaded(currentBooks));
  }

  Future<void> deleteBook(String id) async {
    if (state is! BooksLoaded) return;
    final currentBooks = List<Book>.from((state as BooksLoaded).books);
    currentBooks.removeWhere((b) => b.id == id);
    await _repository.saveBooks(currentBooks);
    emit(BooksLoaded(currentBooks));
  }
}
