import 'package:dio/dio.dart';
import 'package:mynextbook/modules/data/remote/service/book_service_constants.dart';

class QueryFormatInterceptor extends Interceptor{
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    
    if(options.path.contains("$queryParam=$queryDivider")){
      final newUrl = options.path.toString().replaceAll("$queryParam=$queryDivider", "$queryParam=");
      options.path = newUrl;
    }

    super.onRequest(options, handler);
  }
}