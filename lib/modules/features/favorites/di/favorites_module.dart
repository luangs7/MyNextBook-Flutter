import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/features/favorites/viewmodel/favorites_view_model.dart';

extension FavoritesModule on GetIt {
  void favoritesModule() {
    registerLazySingleton<FavoritesViewModel>(() => FavoritesViewModel(
        getFavoriteBooks: get(),
        removeBookFromFavorite: get(),
        getCurrentUser: get()));
  }
}
