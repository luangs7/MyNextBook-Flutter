import 'package:mynextbook/modules/data/local/dao/book_dao.dart';
import 'package:mynextbook/modules/data/local/mapper/book_entity_mapper.dart';
import 'package:mynextbook/modules/data/repository/datasource/book_data_source_local.dart';
import 'package:mynextbook/modules/data/repository/model/book_data.dart';

class BookDataSourceLocalImpl extends BookDataSourceLocal {
  final BookDao dao;
  final BookEntityMapper mapper;

  BookDataSourceLocalImpl({required this.dao, required this.mapper});

  @override
  Future<BookData?> getFavoriteBook(String id, String userId) async {
    final book = await dao.getFavoritesById(id + userId);
    return book != null ? mapper.toRepo(book) : null;
  }

  @override
  Future<List<BookData>> getFavoritesBooks(String userId) async {
    final result = await dao.getFavorites(userId);
    return result.map((e) => mapper.toRepo(e)).toList();
  }

  @override
  Future<void> removeFavoriteBook(BookData bookData, String userId) async {
    return await dao.delete(bookData.id, userId);
  }

  @override
  Future<void> setFavoriteBook(BookData bookData, String userId) async {
    return await dao.insertBook(mapper.toEntity(bookData, userId));
  }
}
