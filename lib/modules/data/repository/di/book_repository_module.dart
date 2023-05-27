import 'package:get_it/get_it.dart';
import 'package:mynextbook/flavors/flavor.dart';
import 'package:mynextbook/flavors/flavor_config.dart';
import 'package:mynextbook/modules/data/repository/implementation/book_local_repository_impl.dart';
import 'package:mynextbook/modules/data/repository/implementation/book_remote_repository_impl.dart';
import 'package:mynextbook/modules/data/repository/implementation/preferences_repository_impl.dart';
import 'package:mynextbook/modules/data/repository/implementation/user_repository_impl.dart';
import 'package:mynextbook/modules/data/repository/mapper/book_repo_mapper.dart';
import 'package:mynextbook/modules/data/repository/mapper/preferences_repo_mapper.dart';
import 'package:mynextbook/modules/data/repository/mapper/user_repo_mapper.dart';
import 'package:mynextbook/modules/domain/repositories/book_local_repository.dart';
import 'package:mynextbook/modules/domain/repositories/book_remote_repository.dart';
import 'package:mynextbook/modules/domain/repositories/preferences_repository.dart';
import 'package:mynextbook/modules/domain/repositories/user_repository.dart';
import 'package:mynextbook/modules/data/repository/mock/user_repository_impl_mock.dart';

extension BookRepositoryModule on GetIt {
  void bookRepositoryModule() {
    registerLazySingleton(() => BookRepoMapper());
    registerLazySingleton(() => UserRepoMapper());
    registerLazySingleton(() => PreferencesRepoMapper());
    registerLazySingleton<BookLocalRepository>(
        () => BookLocalRepositoryImpl(mapper: get(), dataSourceLocal: get()));
    registerLazySingleton<BookRemoteRepository>(() => BookRemoteRepositoryImpl(
        bookMapper: get(),
        dataSourceLocal: get(),
        dataSourceRemote: get(),
        prefMapper: get()));
    registerLazySingleton<PreferencesRepository>(() =>
        PreferencesRepositoryImpl(dataSourceDatastore: get(), mapper: get()));
    registerLazySingleton<UserDataRepository>(() {
      if (FlavorConfig.instance.flavor == Flavor.mock) {
        return UserDataRepositoryImplMock();
      } else {
        return UserDataRepositoryImpl(
          cloudServicesAuth: get(),
          mapper: get(),
          userDataRepositoryImpl: get(),
        );
      }
    });
  }
}
