import 'package:mynextbook/modules/data/local/dao/book_dao.dart';
import 'package:mynextbook/modules/data/local/model/book_entity.dart';

class BookDaoMock extends BookDao {
  @override
  Future<void> delete(String bookId) async {
    return;
  }

  @override
  Future<List<BookEntity>> getFavorites() async {
    return List.empty();
  }

  @override
  Stream<BookEntity?> getFavoritesById(String bookId) {
    return const Stream.empty();
  }

  @override
  Future<void> insertBook(BookEntity book) async {
    return;
  }
}
