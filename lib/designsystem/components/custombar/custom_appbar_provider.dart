import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final customBarProvider = ChangeNotifierProvider((ref) => CustomBarState());

class CustomBarState extends ChangeNotifier {
  bool hasSignOut = false;
  bool showBackButton = false;
  bool showActions = false;
  bool resizeToAvoidBottomInset = false;
  bool isVisible = false;
  String title = "";
}

extension CustomBar on CustomBarState {
  void changeState(
      {bool hasSignOut = false,
      bool showBackButton = false,
      bool showActions = false,
      bool resizeToAvoidBottomInset = false,
      bool isVisible = true,
      String title = ""}) {
    this.hasSignOut = hasSignOut;
    this.showBackButton = showBackButton;
    this.showActions = showActions;
    this.resizeToAvoidBottomInset = resizeToAvoidBottomInset;
    this.isVisible = isVisible;
    this.title = title;
  }
}
