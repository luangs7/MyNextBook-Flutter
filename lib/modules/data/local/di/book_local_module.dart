import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/data/local/dao/book_dao.dart';
import 'package:mynextbook/modules/data/local/datasource/book_datasource_local_impl.dart';
import 'package:mynextbook/modules/data/local/mapper/book_entity_mapper.dart';
import 'package:mynextbook/modules/data/repository/datasource/book_data_source_local.dart';
import 'package:mynextbook/modules/data/local/model/book_entity.dart';

import '../../../../objectbox.g.dart';
import '../dao/bok_dao_impl.dart';

extension BookLocalModule on GetIt {
  void bookLocalModule() async {
    registerSingletonAsync(() => openStore());
    registerLazySingleton(() => get<Store>().box<BookEntity>());
    registerLazySingleton(() => BookEntityMapper());
    registerLazySingleton<BookDao>(() => BookDaoImpl(box: get()));
    registerLazySingleton<BookDataSourceLocal>(() => BookDataSourceLocalImpl(
        dao: get<BookDao>(), mapper: get<BookEntityMapper>()));
  }
}
