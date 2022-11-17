import 'package:mynextbook/common/base/api_result.dart';
import 'package:mynextbook/modules/domain/model/book.dart';

abstract class BookLocalRepository {
  Future<ApiResult<List<Book>>> getFavorites();
  Future<ApiResult<void>> addFavorites(Book book);
  Future<ApiResult<void>> removeFavorite(Book book);
}
