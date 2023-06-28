import 'package:mynextbook/common/base/api_result.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:mynextbook/modules/domain/repositories/book_local_repository.dart';

abstract class RemoveBookFromFavorite {
  Future<ApiResult<void>> execute(Book params, String userId);
}

class RemoveBookFromFavoriteImpl extends RemoveBookFromFavorite {
  final BookLocalRepository repository;

  RemoveBookFromFavoriteImpl({required this.repository});

  @override
  Future<ApiResult<void>> execute(Book params, String userId) {
    return repository.removeFavorite(params, userId);
  }
}
