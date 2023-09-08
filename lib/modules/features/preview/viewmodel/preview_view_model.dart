import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/modules/domain/interactor/add_favorite_book.dart';
import 'package:mynextbook/modules/domain/interactor/get_book_by_id.dart';
import 'package:mynextbook/modules/domain/interactor/get_current_user.dart';
import 'package:mynextbook/modules/domain/interactor/get_preferences.dart';
import 'package:mynextbook/modules/domain/interactor/get_random_book.dart';
import 'package:mynextbook/modules/domain/interactor/remove_book_from_favorite.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:mynextbook/modules/features/preview/viewmodel/preview_view_state.dart';

import '../../../../common/base/api_result.dart';
import '../../../domain/model/user.dart';

final previewViewModelProvider =
    ChangeNotifierProvider((ref) => GetIt.I.get<PreviewViewModel>());

class PreviewViewModel extends ChangeNotifier {
  final GetPreferences getPreferences;
  final GetRandomBook getRandomBook;
  final AddFavoriteBook addFavoriteBook;
  final RemoveBookFromFavorite removeBookFromFavorite;
  final GetCurrentUser getCurrentUser;
  final GetBookById getBookById;

  bool _itemFavoriteState = false;
  bool get itemFavoriteState => _itemFavoriteState;

  PreviewViewState _previewState = PreviewViewState.init();
  PreviewViewState get previewState => _previewState;

  PreviewViewModel(
      {required this.getPreferences,
      required this.getRandomBook,
      required this.addFavoriteBook,
      required this.removeBookFromFavorite,
      required this.getCurrentUser,
      required this.getBookById});


  Future<void> getBook(String? id) async {
    if (id != null) {
      return getBookId(id);
    } else {
      return getBookRandom();
    }
  }
  Future<void> getBookRandom() async {
    final user = await getCurrentUser.execute();
    if (user == null) return;
    final preferences = await getPreferences.execute(user.uuid);
    getRandomBook.execute(preferences, user.uuid).then((value) {
      return value.handle<Book>(
          success: (data) {
            _itemFavoriteState = data.isFavorited;
            setItemRandomState(ViewState.success(data));
          },
          error: (error) => setItemRandomState(ViewState.error(error)),
          empty: (() => setItemRandomState(ViewState.empty())));
    });
  }

  Future<void> getBookId(String id) async {
    final user = await getUser();
    getBookById.execute(id, user?.uuid).then((value) {
      return value.handle<Book>(
          success: (data) {
            _itemFavoriteState = data.isFavorited;
            setItemRandomState(ViewState.success(data));
          },
          error: (error) => setItemRandomState(ViewState.error(error)),
          empty: (() => setItemRandomState(ViewState.empty())));
    });
  }

  Future<void> setFavoriteBook(Book book) async {
    final user = await getUser();
    if (user == null) return;
    if (book.isFavorited) {
      return removeFavoriteBook(book);
    } else {
      return addFavorite(book, user.uuid);
    }
  }

  void setItemRandomState(ViewState viewState) {
    _previewState = _previewState.copyWith(state: viewState);
    notifyListeners();
  }

  void removeFavoriteBook(Book book) async {
    final user = await getUser();
    if (user == null) return;
    removeBookFromFavorite.execute(book, user.uuid).then((value) {
      return value.handle(success: ((data) {
        _itemFavoriteState = false;
        notifyListeners();
      }));
    });
  }

  void addFavorite(Book book, String uuid) async {
    addFavoriteBook.execute(book, uuid).then((value) {
      return value.handle(success: ((data) {
        _itemFavoriteState = true;
        notifyListeners();
      }));
    });
  }

  Future<User?> getUser() async {
    return await getCurrentUser.execute();
  }

  resetState() {
    _previewState = PreviewViewState.init();
    notifyListeners();
  }
}
