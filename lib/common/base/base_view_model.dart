import 'package:flutter/foundation.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:state_notifier/state_notifier.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.empty();

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }

  void setStateWithNotifier(ViewState viewState, ViewState stateNotifier) {
    stateNotifier = viewState;
    notifyListeners();
  }
}
