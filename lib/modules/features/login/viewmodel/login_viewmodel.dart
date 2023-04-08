import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final loginViewModelProvider =
    ChangeNotifierProvider((ref) => GetIt.I.get<LoginViewModel>());

class LoginViewModel extends ChangeNotifier {}
