import 'package:flutter/material.dart';
import 'package:mynextbook/common/base/view_state.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.empty();

  ViewState get state => _state;

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
