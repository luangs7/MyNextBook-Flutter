import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/domain/interactor/add_favorite_book.dart';
import 'package:mynextbook/modules/domain/interactor/get_favorite_books.dart';
import 'package:mynextbook/modules/domain/interactor/get_preferences.dart';
import 'package:mynextbook/modules/domain/interactor/get_random_book.dart';
import 'package:mynextbook/modules/domain/interactor/remove_book_from_favorite.dart';
import 'package:mynextbook/modules/domain/interactor/update_preferences.dart';

extension DomainModule on GetIt {
  void domainModule() {
    registerFactory(() => AddFavoriteBookImpl(repository: get()));
    registerFactory(() => GetFavoriteBooksImpl(repository: get()));
    registerFactory(() => GetPreferencesImpl(repository: get()));
    registerFactory(() => GetRandomBookImpl(repository: get()));
    registerFactory(() => RemoveBookFromFavoriteImpl(repository: get()));
    registerFactory(() => UpdatePreferencesImpl(repository: get()));
  }
}
