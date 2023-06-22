import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/base_view_model.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/modules/domain/interactor/get_current_user.dart';
import 'package:mynextbook/modules/domain/interactor/get_favorite_books.dart';
import 'package:mynextbook/modules/domain/interactor/remove_book_from_favorite.dart';
import 'package:mynextbook/modules/domain/model/book.dart';

final favoritesViewModelProvider = ChangeNotifierProvider((ref) {
  return GetIt.I.get<FavoritesViewModel>();
});

class FavoritesViewModel extends BaseViewModel {
  final GetFavoriteBooks getFavoriteBooks;
  final RemoveBookFromFavorite removeBookFromFavorite;
  final GetCurrentUser getCurrentUser;

  FavoritesViewModel(
      {required this.getFavoriteBooks,
      required this.removeBookFromFavorite,
      required this.getCurrentUser});

  Future<void> getFavoriteItems() async {
    getCurrentUser.execute().then((user) {
      if (user == null) return;
      getFavoriteBooks.execute(user.uuid).then((result) {
        return result.when(success: (data) {
          setState(ViewState.success(data));
        }, error: (error) {
          setState(ViewState.error(error));
        }, empty: () {
          setState(ViewState.empty());
        });
      });
    });
  }

  Future<void> removeItem(Book book) async {
    setState(ViewState.loading());
    removeBookFromFavorite.execute(book).then((result) {
      return result.when(
          success: (data) {
            getFavoriteItems();
          },
          error: (error) {
            setState(ViewState.error(error));
          },
          empty: (() => ViewState.empty()));
    });
  }
}
