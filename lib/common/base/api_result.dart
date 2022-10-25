// ignore: depend_on_referenced_packages
import 'package:freezed_annotation/freezed_annotation.dart';

part 'api_result.freezed.dart';

@freezed
class ApiResult<T> with _$ApiResult {
  factory ApiResult.success(T? data) = _Success<T>;
  factory ApiResult.error(Exception? exception) = _Error;
  factory ApiResult.empty() = _Empty;
}