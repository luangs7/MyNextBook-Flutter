import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/data/local/dao/book_database.dart';
import 'package:mynextbook/modules/data/local/datasource/book_datasource_local_impl.dart';
import 'package:mynextbook/modules/data/local/mapper/book_entity_mapper.dart';

extension BookLocalModule on GetIt {
  void bookLocalModule() {
    registerLazySingleton(() => BookEntityMapper());
    registerLazySingleton(() => $FloorBookDatabase.databaseBuilder("app_database.db").build());
    registerLazySingleton(() => (get() as BookDatabase).bookDao);
    registerFactory(() => BookDataSourceLocalImpl(dao: get(), mapper: get()));
  }
}
