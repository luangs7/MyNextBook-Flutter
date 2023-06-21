import 'package:dio/dio.dart';
import 'package:mynextbook/modules/data/remote/service/book_service_constants.dart';

class QueryFormatInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var parameters = options.queryParameters;
    if (options.uri.query.contains("$queryParam=$queryDivider")) {
      parameters = {
        queryParam: "$orderByQuery=${options.queryParameters[orderByQuery]}"
      };
    }
    super.onRequest(options.copyWith(queryParameters: parameters), handler);
  }
}
