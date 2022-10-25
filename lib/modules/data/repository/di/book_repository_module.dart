import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/data/repository/implementation/book_local_repository_impl.dart';
import 'package:mynextbook/modules/data/repository/implementation/book_remote_repository_impl.dart';
import 'package:mynextbook/modules/data/repository/implementation/preferences_repository_impl.dart';
import 'package:mynextbook/modules/data/repository/mapper/book_repo_mapper.dart';
import 'package:mynextbook/modules/data/repository/mapper/preferences_repo_mapper.dart';

extension BookRepositoryModule on GetIt {
    void bookRepositoryModule() {
      registerLazySingleton(() => BookRepoMapper());
      registerLazySingleton(() => PreferencesRepoMapper());
      registerFactory(() => BookLocalRepositoryImpl(mapper: get(), dataSourceLocal: get()));
      registerFactory(() => BookRemoteRepositoryImpl(bookMapper: get(),dataSourceLocal: get(),dataSourceRemote: get(), prefMapper: get()));
      registerFactory(() => PreferencesRepositoryImpl(dataSourceDatastore: get(), mapper: get()));
    }
  }