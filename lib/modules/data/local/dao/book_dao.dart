import 'package:floor/floor.dart';
import 'package:mynextbook/modules/data/local/model/book_entity.dart';

@dao
abstract class BookDao {
  @insert
  Future<void> insertBook(BookEntity book);

  @Query('SELECT * FROM BookEntity WHERE uuid = :uuid')
  Future<BookEntity?> getFavoritesById(String uuid);

  @Query('SELECT * FROM BookEntity where userId = :userId')
  Future<List<BookEntity>> getFavorites(String userId);

  @Query('DELETE FROM BookEntity WHERE id=:bookId AND userId = :userId')
  Future<void> delete(String bookId, String userId);
}
