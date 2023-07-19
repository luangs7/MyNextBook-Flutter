import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/data/remote/datasource/book_data_source_remote_impl.dart';
import 'package:mynextbook/modules/data/remote/interceptor/query_format_interceptor.dart';
import 'package:mynextbook/modules/data/remote/mapper/book_remote_mapper.dart';
import 'package:dio/dio.dart';
import 'package:mynextbook/modules/data/remote/service/book_service.dart';
import 'package:mynextbook/modules/data/remote/service/book_service_mock.dart';
import 'package:mynextbook/modules/data/repository/datasource/book_data_source_remote.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:mynextbook/flavors/flavor_config.dart';

import '../service/book_service_impl.dart';

extension RemoteModule on GetIt {
  void remoteModule() {
    registerLazySingleton(() => BookRemoteMapper());
    registerLazySingleton<BookService>(() => FlavorConfig.isMOCK()
        ? BookServiceMock()
        : BookServiceImpl(createDioOptions(),
            baseUrl: FlavorConfig.instance.values.apiBaseUrl));

    registerLazySingleton<BookDataSourceRemote>(
        () => BookDataSourceRemoteImpl(mapper: get(), service: get()));
  }

  Dio createDioOptions() {
    final dio = Dio();
    dio.interceptors.add(PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90));

    dio.interceptors.add(QueryFormatInterceptor());
    dio.options.followRedirects = true;

    return dio;
  }
}
