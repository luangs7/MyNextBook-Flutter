import 'package:mynextbook/modules/data/local/dao/book_dao.dart';
import 'package:mynextbook/modules/data/local/model/book_entity.dart';

import '../../../../objectbox.g.dart';

class BookDaoImpl extends BookDao {
  final Box<BookEntity> box;

  BookDaoImpl({required this.box});

  @override
  Future<void> delete(String bookId, String userId) async {
    final item = await getFavoritesById(bookId, userId);
    if (item != null) {
      box.remove(item.id);
    }
    return;
  }

  @override
  Future<List<BookEntity>> getFavorites(String userId) async {
    final query = box.query(BookEntity_.userId.equals(userId)).build();
    final result = await query.findAsync();
    query.close();
    return result;
  }

  @override
  Future<BookEntity?> getFavoritesById(String bookId, String userId) async {
    final query = box
        .query(BookEntity_.userId
            .equals(userId)
            .and(BookEntity_.uuid.equals(bookId)))
        .build();
    final result = await query.findFirstAsync();
    query.close();
    return result;
  }

  @override
  Future<void> insertBook(BookEntity book) async {
    await box.putAsync(book);
    return;
  }
}
