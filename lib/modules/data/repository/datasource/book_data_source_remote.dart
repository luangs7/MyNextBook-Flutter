import 'package:mynextbook/modules/data/repository/model/app_preferences_repo.dart';
import 'package:mynextbook/modules/data/repository/model/book_data.dart';

abstract class BookDataSourceRemote {
  Future<BookData?> getBooksFromQuery(AppPreferencesRepo pref);
  Future<BookData?> getBooksById(String id);
  Future<List<BookData>> getRecommendation(AppPreferencesRepo pref);
}
