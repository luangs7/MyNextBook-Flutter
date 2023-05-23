import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/domain/interactor/add_favorite_book.dart';
import 'package:mynextbook/modules/domain/interactor/do_login.dart';
import 'package:mynextbook/modules/domain/interactor/get_current_user.dart';
import 'package:mynextbook/modules/domain/interactor/get_favorite_books.dart';
import 'package:mynextbook/modules/domain/interactor/get_login_email.dart';
import 'package:mynextbook/modules/domain/interactor/get_preferences.dart';
import 'package:mynextbook/modules/domain/interactor/get_random_book.dart';
import 'package:mynextbook/modules/domain/interactor/remove_book_from_favorite.dart';
import 'package:mynextbook/modules/domain/interactor/set_login_email.dart';
import 'package:mynextbook/modules/domain/interactor/update_preferences.dart';

extension DomainModule on GetIt {
  void domainModule() {
    registerLazySingleton<AddFavoriteBook>(
        () => AddFavoriteBookImpl(repository: get()));
    registerLazySingleton<GetFavoriteBooks>(
        () => GetFavoriteBooksImpl(repository: get()));
    registerLazySingleton<GetPreferences>(
        () => GetPreferencesImpl(repository: get()));
    registerLazySingleton<GetRandomBook>(
        () => GetRandomBookImpl(repository: get()));
    registerLazySingleton<RemoveBookFromFavorite>(
        () => RemoveBookFromFavoriteImpl(repository: get()));
    registerLazySingleton<UpdatePreferences>(
        () => UpdatePreferencesImpl(repository: get()));
    registerLazySingleton<GetCurrentUser>(
        () => GetCurrentUserImpl(repository: get()));
    registerLazySingleton<DoLogin>(() => DoLoginImpl(repository: get()));
    registerLazySingleton<GetEmailLogin>(
        () => GetEmailLoginImpl(repository: get()));
    registerLazySingleton<SetEmailLogin>(
        () => SetEmailLoginImpl(repository: get()));
  }
}
