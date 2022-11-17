// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'view_state.freezed.dart';

@freezed
class ViewState<T> with _$ViewState {
  factory ViewState.success(T data) = _Success<T>;
  factory ViewState.error(Exception? exception) = _Error;
  factory ViewState.loading() = _Loading;
  factory ViewState.empty() = _Empty;
}
