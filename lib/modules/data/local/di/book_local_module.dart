import 'package:floor/floor.dart';
import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/data/local/dao/book_dao.dart';
import 'package:mynextbook/modules/data/local/datasource/book_datasource_local_impl.dart';
import 'package:mynextbook/modules/data/local/mapper/book_entity_mapper.dart';
import 'package:mynextbook/modules/data/repository/datasource/book_data_source_local.dart';
import '../dao/book_dao_mock.dart';

extension BookLocalModule on GetIt {
  void bookLocalModule() {
    registerLazySingleton(() => BookEntityMapper());
    registerLazySingleton<BookDao>(() => BookDaoMock());
    registerLazySingleton<BookDataSourceLocal>(() => BookDataSourceLocalImpl(
        dao: get<BookDao>(), mapper: get<BookEntityMapper>()));
  }
}
