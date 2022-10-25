import 'package:mynextbook/modules/data/repository/model/book_data.dart';

abstract class BookDataSourceLocal {
  Future<void> setFavoriteBook(BookData bookData);
  Future<void> removeFavoriteBook(BookData bookData);
  Future<List<BookData>> getFavoritesBooks();
  Future<BookData?> getFavoriteBook(String id);
}