import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:mynextbook/modules/data/remote/model/book_response.dart';
import 'package:mynextbook/modules/data/remote/service/book_service.dart';

class BookServiceMock extends BookService {
  @override
  Future<BookResponse> getBooks(String query, String? language, String? filter,
      String orderBy, int maxResults) async {
    final String response =
        await rootBundle.loadString('lib/assets/book_response.json');
    final data = await json.decode(response);
    return BookResponse.fromJson(data);
  }
}
