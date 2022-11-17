import 'dart:convert';

import 'package:floor/floor.dart';

class StringConverter extends TypeConverter<List<String>?, String?> {
  @override
  List<String>? decode(String? databaseValue) {
    final jsonFile = json.decode(databaseValue ?? "");
    return jsonFile;
  }

  @override
  String? encode(List<String>? value) {
    return json.encode(value ?? List.empty());
  }
}
