import 'package:mynextbook/common/base/api_result.dart';
import 'package:mynextbook/modules/data/repository/datasource/book_data_source_local.dart';
import 'package:mynextbook/modules/data/repository/mapper/book_repo_mapper.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:mynextbook/modules/domain/repositories/book_local_repository.dart';

class BookLocalRepositoryImpl extends BookLocalRepository {
  final BookDataSourceLocal dataSourceLocal;
  final BookRepoMapper mapper;

  BookLocalRepositoryImpl({required this.dataSourceLocal, required this.mapper});

  @override
  Future<ApiResult<void>> addFavorites(Book book) async {
    try {
      final result = await dataSourceLocal.setFavoriteBook(mapper.toRepo(book));
      return ApiResult.success(result);
    } on Exception catch (e, _) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<List<Book>>> getFavorites() async {
    try {
      final result = await dataSourceLocal.getFavoritesBooks();
      final resultList = result.map((e) => mapper.toDomain(e)).toList();
      return resultList.isEmpty ? ApiResult.empty() : ApiResult.success(resultList);
    } on Exception catch (e, _) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<void>> removeFavorite(Book book) async {
    try {
      final result = await dataSourceLocal.removeFavoriteBook(mapper.toRepo(book));
      return ApiResult.success(result);
    } on Exception catch (e, _) {
      return ApiResult.error(e);
    }
  }
}
