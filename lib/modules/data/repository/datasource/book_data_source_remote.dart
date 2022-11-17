import 'package:mynextbook/modules/data/repository/model/app_preferences_repo.dart';
import 'package:mynextbook/modules/data/repository/model/book_data.dart';

abstract class BookDataSourceRemote {
  Future<BookData> getBooksFromQuery(AppPreferencesRepo appPreferencesRepo);
}
