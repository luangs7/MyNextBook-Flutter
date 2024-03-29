import 'dart:async';

import 'package:floor/floor.dart';
import 'package:mynextbook/modules/data/local/converter/string_converter.dart';
import 'package:mynextbook/modules/data/local/dao/book_dao.dart';
import 'package:mynextbook/modules/data/local/model/book_entity.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'book_database.g.dart';

@Database(version: 2, entities: [BookEntity])
@TypeConverters([StringConverter])
abstract class BookDatabase extends FloorDatabase {
  BookDao get bookDao;
}
