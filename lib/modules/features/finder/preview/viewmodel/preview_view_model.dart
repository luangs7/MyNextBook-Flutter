import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/modules/domain/interactor/add_favorite_book.dart';
import 'package:mynextbook/modules/domain/interactor/get_current_user.dart';
import 'package:mynextbook/modules/domain/interactor/get_preferences.dart';
import 'package:mynextbook/modules/domain/interactor/get_random_book.dart';
import 'package:mynextbook/modules/domain/interactor/remove_book_from_favorite.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:provider/provider.dart';

// final previewViewModelProvider = ChangeNotifierProvider(create: GetIt.I.get());

class PreviewViewModel extends ChangeNotifier {
  final GetPreferences getPreferences;
  final GetRandomBook getRandomBook;
  final AddFavoriteBook addFavoriteBook;
  final RemoveBookFromFavorite removeBookFromFavorite;
  final GetCurrentUser getCurrentUser;

  ViewState _itemFavoriteState = ViewState.empty();
  ViewState _itemRandomState = ViewState.empty();

  ViewState get itemFavoriteState => _itemFavoriteState;
  ViewState get itemRandomState => _itemRandomState;

  PreviewViewModel(
      {required this.getPreferences,
      required this.getRandomBook,
      required this.addFavoriteBook,
      required this.removeBookFromFavorite,
      required this.getCurrentUser});

  Future<void> getBook() async {
    setItemRandomState(ViewState.loading());
    final user = await getCurrentUser.execute();
    if (user == null) return;
    final preferences = await getPreferences.execute(user.uuid);
    getRandomBook.execute(preferences).then((value) {
      return value.when(
          success: (data) => setItemRandomState(ViewState.success(data)),
          error: (error) => setItemRandomState(ViewState.error(error)),
          empty: (() => setItemRandomState(ViewState.empty())));
    });
  }

  Future<void> setFavoriteBook(Book book) async {
    setItemFavoriteState(ViewState.loading());
    final user = await getCurrentUser.execute();
    if (user == null) return;
    if (book.isFavorited) {
      removeBookFromFavorite.execute(book).then((value) {
        return value.when(
            success: ((data) => setItemFavoriteState(ViewState.success(data))),
            error: ((exception) =>
                setItemFavoriteState(ViewState.error(exception))),
            empty: () => setItemFavoriteState(ViewState.empty()));
      });
    } else {
      addFavoriteBook.execute(book, user.uuid).then((value) {
        return value.when(
            success: ((data) => setItemFavoriteState(ViewState.success(data))),
            error: ((exception) =>
                setItemFavoriteState(ViewState.error(exception))),
            empty: () => setItemFavoriteState(ViewState.empty()));
      });
    }
  }

  void setItemRandomState(ViewState viewState) {
    _itemFavoriteState = viewState;
    notifyListeners();
  }

  void setItemFavoriteState(ViewState viewState) {
    _itemRandomState = viewState;
    notifyListeners();
  }
}
