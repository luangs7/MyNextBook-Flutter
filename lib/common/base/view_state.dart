// ignore: depend_on_referenced_packages
// ignore_for_file: avoid_init_to_null

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:equatable/equatable.dart';

part 'view_state.freezed.dart';

@freezed
class ViewState<T> with _$ViewState {
  factory ViewState.success(T data) = _Success<T>;
  factory ViewState.error(Exception? exception) = _Error;
  factory ViewState.loading() = _Loading;
  factory ViewState.empty() = _Empty;
}

extension HandleState<T> on ViewState {
  void handleState(
      {Function(T data)? success,
      Function(Exception? exception)? error = null,
      Function? loading = null,
      Function? empty = null,
      Function(ViewState)? onEach = null}) {
    onEach?.call(this);
    when(
        success: (data) => success?.call(data),
        error: (exception) => error?.call(exception),
        loading: () => loading?.call(),
        empty: () => empty?.call());
  }
}
