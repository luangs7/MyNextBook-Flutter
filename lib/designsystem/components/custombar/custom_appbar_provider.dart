import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final customBarProvider = ChangeNotifierProvider((ref) => CustomBarState());

class CustomBarState extends ChangeNotifier {
  bool hasSignOut = false;
  bool showBackButton = false;
  bool showActions = false;
  bool resizeToAvoidBottomInset = false;

  notifty() {
    notifyListeners();
  }
}
