import 'package:mynextbook/modules/data/local/model/book_entity.dart';

abstract class BookDao {
  Future<void> insertBook(BookEntity book);

  Future<BookEntity?> getFavoritesById(String bookId, String userId);

  Future<List<BookEntity>> getFavorites(String userId);

  Future<void> delete(String bookId, String userId);
}
