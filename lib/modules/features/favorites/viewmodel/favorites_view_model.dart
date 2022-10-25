import 'package:get_it/get_it.dart';
import 'package:mynextbook/common/base/base_view_model.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/modules/domain/interactor/get_favorite_books.dart';
import 'package:mynextbook/modules/domain/interactor/remove_book_from_favorite.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:provider/provider.dart';

final userViewModelProvider =
    ChangeNotifierProvider(create: (ref) => GetIt.I.get());

class FavoritesViewModel extends BaseViewModel {
    final GetFavoriteBooks getFavoriteBooks;
    final RemoveBookFromFavorite removeBookFromFavorite;

    FavoritesViewModel({
      required this.getFavoriteBooks,
      required this.removeBookFromFavorite
    });

    Future<void> getFavoriteItems() async {
      setState(ViewState.loading());
      getFavoriteBooks.execute().then((result) {
      return result.when(
        success: (data) {
            setState(ViewState.success(data));
          }, 
        error: (error) {
            setState(ViewState.error(error));
          }, 
        empty: (() => ViewState.empty())
      );
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
        empty: (() => ViewState.empty())
      );
      });
    }
}