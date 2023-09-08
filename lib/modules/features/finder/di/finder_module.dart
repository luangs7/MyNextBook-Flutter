import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/features/preview/viewmodel/preview_view_model.dart';

extension FinderModule on GetIt {
  void finderModule() {
    registerLazySingleton<PreviewViewModel>(() => PreviewViewModel(
        addFavoriteBook: get(),
        getPreferences: get(),
        getRandomBook: get(),
        removeBookFromFavorite: get(),
        getCurrentUser: get(),
        getBookById: get()));
  }
}
