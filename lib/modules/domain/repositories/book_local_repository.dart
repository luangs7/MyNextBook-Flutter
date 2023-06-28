import 'package:mynextbook/common/base/api_result.dart';
import 'package:mynextbook/modules/domain/model/book.dart';

abstract class BookLocalRepository {
  Future<ApiResult<List<Book>>> getFavorites(String userId);
  Future<ApiResult<void>> addFavorites(Book book, String userId);
  Future<ApiResult<void>> removeFavorite(Book book, String userId);
}
