import 'package:mynextbook/common/base/api_result.dart';
import 'package:mynextbook/modules/data/repository/datasource/book_data_source_local.dart';
import 'package:mynextbook/modules/data/repository/datasource/book_data_source_remote.dart';
import 'package:mynextbook/modules/data/repository/mapper/book_repo_mapper.dart';
import 'package:mynextbook/modules/data/repository/mapper/preferences_repo_mapper.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:mynextbook/modules/domain/model/app_preferences.dart';
import 'package:mynextbook/modules/domain/repositories/book_remote_repository.dart';

class BookRemoteRepositoryImpl extends BookRemoteRepository {
  final BookDataSourceRemote dataSourceRemote;
  final BookDataSourceLocal dataSourceLocal;
  final BookRepoMapper bookMapper;
  final PreferencesRepoMapper prefMapper;

  BookRemoteRepositoryImpl({
    required this.dataSourceRemote,
    required this.dataSourceLocal,
    required this.bookMapper,
    required this.prefMapper,
  });

  @override
  Future<ApiResult<Book>> getRandomBook(
      AppPreferences params, String userId) async {
    try {
      final book =
          await dataSourceRemote.getBooksFromQuery(prefMapper.toRepo(params));
      if (book != null) {
        final localBook =
            await dataSourceLocal.getFavoriteBook(book.id, userId);
        book.isFavorited = localBook != null;
        return ApiResult.success(bookMapper.toDomain(book));
      } else {
        return ApiResult.empty();
      }
    } on Exception catch (e, _) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<List<Book>>> getRecommendations(
      AppPreferences? params) async {
    try {
      final prefs = params ?? AppPreferences.init();
      final list =
          await dataSourceRemote.getRecommendation(prefMapper.toRepo(prefs));
      if (list.isNotEmpty) {
        return ApiResult.success(
            list.map((e) => bookMapper.toDomain(e)).toList());
      } else {
        return ApiResult.empty();
      }
    } on Exception catch (e, _) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<Book>> getBookById(String bookId, String? userId) async {
    try {
      final item =
          await dataSourceRemote.getBooksById(bookId);
      if (item != null) {
        if (userId != null) {
          final localBook =
          await dataSourceLocal.getFavoriteBook(item.id, userId);
          item.isFavorited = localBook != null;
        }
        return ApiResult.success(bookMapper.toDomain(item));
      } else {
        return ApiResult.empty();
      }
    } on Exception catch (e, _) {
      return ApiResult.error(e);
    }
  }
}
