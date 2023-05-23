import 'package:mynextbook/common/base/api_result.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:mynextbook/modules/domain/repositories/book_local_repository.dart';

abstract class AddFavoriteBook {
  Future<ApiResult<void>> execute(Book book, String userId);
}

class AddFavoriteBookImpl extends AddFavoriteBook {
  final BookLocalRepository repository;

  AddFavoriteBookImpl({required this.repository});

  @override
  Future<ApiResult<void>> execute(Book book, String userId) async {
    return repository.addFavorites(book, userId);
  }
}
