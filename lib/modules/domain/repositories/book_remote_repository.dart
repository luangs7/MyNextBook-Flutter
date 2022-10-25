import 'package:mynextbook/common/base/api_result.dart';
import 'package:mynextbook/modules/domain/model/app_preferences.dart';
import 'package:mynextbook/modules/domain/model/book.dart';

abstract class BookRemoteRepository {
  Future<ApiResult<Book>> getRandomBook(AppPreferences params);
}