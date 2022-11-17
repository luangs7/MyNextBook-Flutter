import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/modules/domain/interactor/get_preferences.dart';
import 'package:mynextbook/modules/domain/interactor/update_preferences.dart';
import 'package:mynextbook/modules/domain/model/app_preferences.dart';
import 'package:provider/provider.dart';

final preferencesViewModelProvider = ChangeNotifierProvider(create: GetIt.I.get());

class PreferencesViewModel extends ChangeNotifier {
  final UpdatePreferences updatePreferences;
  final GetPreferences getPreferences;

  ViewState _setPreferenceState = ViewState.empty();
  ViewState _getPreferenceState = ViewState.empty();

  ViewState get setPreferenceState => _setPreferenceState;
  ViewState get getPreferenceState => _getPreferenceState;

  PreferencesViewModel({required this.updatePreferences, required this.getPreferences});

  Future onSetPreferences(bool isEbook, String? keyword, bool isPortuguese) async {
    _setPreferenceState = ViewState.loading();
    final prefs = AppPreferences(isEbook: isEbook, keyword: keyword, isPortuguese: isPortuguese, subject: null);
    updatePreferences.execute(prefs).then((value) {
      _setPreferenceState = ViewState.success(prefs);
      notifyListeners();
    }).catchError((onError) {
      _setPreferenceState = ViewState.error(onError);
    });
  }

  Future getAppPreferences() async {
    _getPreferenceState = ViewState.loading();
    getPreferences.execute().then((value) {
      _getPreferenceState = ViewState.success(value);
    }).catchError((onError) {
      _getPreferenceState = ViewState.error(onError);
    });
  }
}
