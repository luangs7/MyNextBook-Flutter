import 'package:mynextbook/modules/data/repository/model/book_data.dart';

abstract class BookDataSourceLocal {
  Future<void> setFavoriteBook(BookData bookData, String userId);
  Future<void> removeFavoriteBook(BookData bookData, String userId);
  Future<List<BookData>> getFavoritesBooks(String userId);
  Future<BookData?> getFavoriteBook(String id, String userId);
}
