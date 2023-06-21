// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult {
  factory ApiResult.success(T? data) = _Success<T>;
  factory ApiResult.error(Exception? exception) = _Error;
  factory ApiResult.empty() = _Empty;
}

extension HandleState<TResultT> on ApiResult {
  void handle<TResult>(
      {Function(TResult data)? success,
      Function(Exception? exception)? error,
      Function? empty}) {
    when(
        success: (data) => success?.call(data),
        error: (exception) => error?.call(exception),
        empty: () => empty?.call());
  }
}

T? castOrNull<T>(dynamic x) => x is T ? x : null;
