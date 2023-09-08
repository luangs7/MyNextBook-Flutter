import 'package:mynextbook/common/base/api_result.dart';
import 'package:mynextbook/modules/domain/model/app_preferences.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:mynextbook/modules/domain/repositories/book_remote_repository.dart';

abstract class GetBookById {
  Future<ApiResult<Book>> execute(String bookId, String? userId);
}

class GetBookByIdImpl extends GetBookById {
  final BookRemoteRepository repository;

  GetBookByIdImpl({required this.repository});

  @override
  Future<ApiResult<Book>> execute(String bookId, String? userId) {
    return repository.getBookById(bookId, userId);
  }
}
