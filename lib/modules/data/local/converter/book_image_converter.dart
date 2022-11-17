import 'dart:convert';

import 'package:floor/floor.dart';
import 'package:mynextbook/modules/data/local/model/book_image_entity.dart';

class BookImageConverter extends TypeConverter<BookImageEntity?, String?> {
  @override
  BookImageEntity? decode(String? databaseValue) {
    final jsonFile = json.decode(databaseValue ?? "");
    return jsonFile;
  }

  @override
  String? encode(BookImageEntity? value) {
    return json.encode(value ?? List.empty());
  }
}
