import 'package:mynextbook/modules/data/local/dao/book_dao.dart';
import 'package:mynextbook/modules/data/local/model/book_entity.dart';

class BookDaoMock extends BookDao {
  @override
  Future<void> delete(String bookId, String userId) async {
    return;
  }

  @override
  Future<List<BookEntity>> getFavorites(String userId) async {
    return List.empty();
  }

  @override
  Future<BookEntity?> getFavoritesById(String uuid) {
    return Future.value(null);
  }

  @override
  Future<void> insertBook(BookEntity book) async {
    return;
  }
}
