import 'package:dio/dio.dart';
import 'package:mynextbook/modules/data/remote/model/book_response.dart';
import 'package:mynextbook/modules/data/remote/service/book_service.dart';
import 'package:mynextbook/modules/data/remote/service/book_service_constants.dart';
import 'package:retrofit/retrofit.dart';
part 'book_service_impl.g.dart';

@RestApi()
abstract class BookServiceImpl extends BookService {
  factory BookServiceImpl(Dio dio, {String baseUrl}) = _BookServiceImpl;

  @override
  @GET("volumes")
  Future<BookResponse> getBooks(
    @Query(queryParam, encoded: true) String query,
    @Query(languageRestrictQuery) String? language,
    @Query(filterQuery) String? filter,
    @Query(orderByQuery) String orderBy,
    @Query(maxresultsQuery) int maxResults,
  );

  @override
  @GET("volumes/{bookId}")
  Future<Item> getBookId(@Path("bookId")String bookId);
}
