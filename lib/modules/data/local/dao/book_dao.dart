import 'package:floor/floor.dart';
import 'package:mynextbook/modules/data/local/model/book_entity.dart';

@dao
abstract class BookDao {
  @insert
  Future<void> insertBook(BookEntity book);

  @Query('SELECT * FROM BookEntity WHERE id = :bookId AND userId = :userId')
  Future<BookEntity?> getFavoritesById(String bookId, String userId);

  @Query('SELECT * FROM BookEntity where userId = :userId')
  Future<List<BookEntity>> getFavorites(String userId);

  @Query('DELETE FROM BookEntity WHERE id=:bookId && userId = :userId')
  Future<void> delete(String bookId, String userId);
}
