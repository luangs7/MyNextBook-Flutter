import 'package:mynextbook/common/base/api_result.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:mynextbook/modules/domain/repositories/book_local_repository.dart';

abstract class GetFavoriteBooks {
  Future<ApiResult<List<Book>>> execute(String userId);
}

class GetFavoriteBooksImpl extends GetFavoriteBooks {
  final BookLocalRepository repository;

  GetFavoriteBooksImpl({required this.repository});

  @override
  Future<ApiResult<List<Book>>> execute(String userId) async {
    return repository.getFavorites(userId);
  }
}
