import 'package:dio/dio.dart';
import 'package:mynextbook/modules/data/remote/model/book_response.dart';
import 'package:mynextbook/modules/data/remote/service/book_service_constants.dart';
import 'package:retrofit/retrofit.dart';
part  'book_service.g.dart';

@RestApi()
abstract class BookService {
  factory BookService(Dio dio, {String baseUrl}) = _BookService;

  @GET("volumes")
  Future<BookResponse> getBooks(
    @Query(queryParam, encoded: false) String query,
    @Query(languageRestrictQuery) String? language,
    @Query(filterQuery) String? filter,
    @Query(orderByQuery) String orderBy,
    @Query(maxresultsQuery) int maxResults,
  );
}
