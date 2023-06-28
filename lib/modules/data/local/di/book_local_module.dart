import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/data/local/dao/book_dao.dart';
import 'package:mynextbook/modules/data/local/dao/book_database.dart';
import 'package:mynextbook/modules/data/local/datasource/book_datasource_local_impl.dart';
import 'package:mynextbook/modules/data/local/mapper/book_entity_mapper.dart';
import 'package:mynextbook/modules/data/repository/datasource/book_data_source_local.dart';

extension BookLocalModule on GetIt {
  void bookLocalModule() async {
    registerSingletonAsync(() async {
      return await $FloorBookDatabase
          .databaseBuilder('app_database.db')
          .build();
    });
    registerLazySingleton(() => BookEntityMapper());
    registerLazySingleton<BookDao>(() => get<BookDatabase>().bookDao);
    registerLazySingleton<BookDataSourceLocal>(() => BookDataSourceLocalImpl(
        dao: get<BookDao>(), mapper: get<BookEntityMapper>()));
  }
}
