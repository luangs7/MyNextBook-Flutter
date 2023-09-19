import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/api_result.dart';
import 'package:mynextbook/common/base/base_view_model.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/modules/domain/interactor/get_current_user.dart';
import 'package:mynextbook/modules/domain/interactor/get_preferences.dart';
import 'package:mynextbook/modules/domain/interactor/get_recommendation.dart';
import 'package:mynextbook/modules/domain/model/book.dart';

final recommendationViewModelProvider = ChangeNotifierProvider((ref) {
  return GetIt.I.get<RecommendationViewModel>();
});

final recommendationFilterChanged = StateProvider<bool>((_) => false);

class RecommendationViewModel extends BaseViewModel {
  final GetRecommendations getRecommendations;
  final GetCurrentUser getCurrentUser;
  final GetPreferences getPreferences;

  RecommendationViewModel(
      {required this.getRecommendations,
      required this.getPreferences,
      required this.getCurrentUser});

  ViewState _bookState = ViewState.loading();
  ViewState get bookState => _bookState;

  Future<void> getBook() async {
    final user = await getCurrentUser.execute();
    final preferences = user != null ? await getPreferences.execute(user.uuid) : null;
    getRecommendations.execute(preferences).then((value) {
      return value.handle<List<Book>>(
          success: (data) {
            setItemRandomState(ViewState.success(data));
          },
          error: (error) => setItemRandomState(ViewState.error(error)),
          empty: (() => setItemRandomState(ViewState.empty())));
    });
  }

  Future<bool> isLoggedIn() async {
    return getCurrentUser.execute().then((value) => value != null);
  }

  void setLoading() {
    _bookState = ViewState.loading();
    notifyListeners();
  }

  void setItemRandomState(ViewState viewState) {
    _bookState = viewState;
    notifyListeners();
  }
}
