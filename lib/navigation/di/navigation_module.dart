import 'package:get_it/get_it.dart';
import 'package:mynextbook/navigation/app_router.dart';
import 'package:mynextbook/navigation/app_router_impl.dart';

extension NavigationModule on GetIt {
  void navigationModule() {
    registerLazySingleton(() => AppRouterImpl() as AppRouter);
  }
}
