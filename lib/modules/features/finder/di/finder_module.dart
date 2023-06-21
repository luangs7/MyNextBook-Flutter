import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/features/favorites/viewmodel/favorites_view_model.dart';
import 'package:mynextbook/modules/features/finder/preview/viewmodel/preview_view_model.dart';

extension FinderModule on GetIt {
  void finderModule() {
    registerLazySingleton<PreviewViewModel>(() => PreviewViewModel(
        addFavoriteBook: get(),
        getPreferences: get(),
        getRandomBook: get(),
        removeBookFromFavorite: get(),
        getCurrentUser: get()));
  }
}
