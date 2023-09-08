import 'package:mynextbook/modules/data/remote/model/book_response.dart';

abstract class BookService {
  Future<BookResponse> getBooks(
    String query,
    String? language,
    String? filter,
    String orderBy,
    int maxResults,
  );

  Future<Item> getBookId(
      String bookId
      );
}
