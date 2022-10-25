import 'package:floor/floor.dart';
import 'package:mynextbook/modules/data/local/model/book_entity.dart';

@dao
abstract class BookDao {
  @insert
  Future<void> insertBook(BookEntity book);

  @Query('SELECT * FROM bookentity WHERE id = :bookId')
  Stream<BookEntity?> getFavoritesById(String bookId);

  @Query('SELECT * FROM bookentity')
  Future<List<BookEntity>> getFavorites();

  @Query('DELETE FROM bookentity WHERE id=:bookId')
  Future<void> delete(String bookId);
}