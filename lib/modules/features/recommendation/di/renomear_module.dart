import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/features/recommendation/viewmodel/recommendation_view_model.dart';

extension RecommendationModule on GetIt {
  void recommendationModule() {
    registerLazySingleton<RecommendationViewModel>(() =>
        RecommendationViewModel(
            getCurrentUser: get(),
            getPreferences: get(),
            getRecommendations: get()));
  }
}
