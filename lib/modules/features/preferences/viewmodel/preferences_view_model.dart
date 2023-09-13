import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/modules/domain/interactor/get_current_user.dart';
import 'package:mynextbook/modules/domain/interactor/get_preferences.dart';
import 'package:mynextbook/modules/domain/interactor/update_preferences.dart';
import 'package:mynextbook/modules/domain/model/app_preferences.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/modules/features/preferences/model/preferences_param.dart';

final preferencesViewModelProvider =
    ChangeNotifierProvider((ref) => GetIt.I.get<PreferencesViewModel>());

class PreferencesViewModel extends ChangeNotifier {
  final UpdatePreferences updatePreferences;
  final GetPreferences getPreferences;
  final GetCurrentUser getCurrentUser;

  ViewState _setPreferenceState = ViewState.empty();
  ViewState _getPreferenceState = ViewState.empty();

  ViewState get setPreferenceState => _setPreferenceState;
  ViewState get getPreferenceState => _getPreferenceState;

  PreferencesViewModel(
      {required this.updatePreferences,
      required this.getPreferences,
      required this.getCurrentUser});

  Future onSetPreferences(PreferencesParam param) async {
    _setPreferenceState = ViewState.loading();
    notifyListeners();
    final prefs = AppPreferences(
        keyword: param.keyword,
        isEbook: param.isEbook,
        isPortuguese: param.isPortuguese,
        subject: param.subject,
        author: param.author,
        editor: param.editor,
        orderBy: param.orderBy,
        title: param.title);
    final user = await getCurrentUser.execute();
    if (user == null) return;
    updatePreferences.execute(prefs, user.uuid).then((value) {
      _setPreferenceState = ViewState.success(prefs);
      notifyListeners();
    }).catchError((onError) {
      _setPreferenceState = ViewState.error(onError);
    });
  }

  Future getAppPreferences() async {
    final user = await getCurrentUser.execute();
    if (user == null) return;
    return getPreferences.execute(user.uuid).then((value) {
      _getPreferenceState = ViewState.success(value);
    }).catchError((onError) {
      _getPreferenceState = ViewState.error(onError);
    }).whenComplete(() => notifyListeners());
  }
}
