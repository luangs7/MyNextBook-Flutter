import 'package:mynextbook/common/base/api_result.dart';
import 'package:mynextbook/modules/domain/model/app_preferences.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:mynextbook/modules/domain/repositories/book_remote_repository.dart';

abstract class GetRandomBook {
  Future<ApiResult<Book>> execute(AppPreferences params, String userId);
}

class GetRandomBookImpl extends GetRandomBook {
  final BookRemoteRepository repository;

  GetRandomBookImpl({required this.repository});

  @override
  Future<ApiResult<Book>> execute(AppPreferences params, String userId) {
    return repository.getRandomBook(params, userId);
  }
}
