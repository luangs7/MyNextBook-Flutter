import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/app_colors.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:mynextbook/designsystem/common/app_theme.dart';
import 'package:mynextbook/modules/cloudservices/application/cloudservices_application.dart';
import 'package:mynextbook/modules/data/datastore/di/book_datastore_module.dart';
import 'package:mynextbook/modules/data/remote/di/book_remote_module.dart';
import 'package:mynextbook/modules/data/local/di/book_local_module.dart';
import 'package:mynextbook/modules/data/repository/di/book_repository_module.dart';
import 'package:mynextbook/modules/domain/di/domain_module.dart';
import 'package:mynextbook/modules/features/finder/di/finder_module.dart';
import 'package:mynextbook/modules/features/home/ui/home_view.dart';
import 'package:mynextbook/modules/features/favorites/di/favorites_module.dart';
import 'package:mynextbook/modules/features/login/di/login_module.dart';
import 'package:mynextbook/modules/features/preferences/di/preferences_module.dart';
import 'package:mynextbook/navigation/di/navigation_module.dart';
import 'package:mynextbook/navigation/app_router.dart';
import 'package:mynextbook/modules/firebase/di/firebase_module.dart';
import 'package:mynextbook/modules/features/login/ui/login_view.dart';

import 'designsystem/components/base_view.dart';

void startApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initApp();
  runApp(const ProviderScope(child: MyApp()));
}

Future _initApp() async {
  _initialiseGetIt();
  final application = GetIt.instance.get<CloudServicesApplication>();
  await application.initialize();
}

void _initialiseGetIt() async {
  GetIt.instance
    ..navigationModule()
    ..datastoreModule()
    ..bookLocalModule()
    ..bookRepositoryModule()
    ..remoteModule()
    ..domainModule()
    ..favoritesModule()
    ..preferencesModule()
    ..firebaseModule()
    ..loginModule()
    ..finderModule();
}

class MyApp extends HookConsumerWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    return FutureBuilder(
        future: GetIt.instance.allReady(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            final AppRouter appRouter = GetIt.I.get();
            return MaterialApp(
                initialRoute: appRouter.loginView,
                routes: appRouter.createRouter(context),
                theme: theme.data,
                themeMode: themeMode,
                darkTheme: AppTheme.dark().data,
                home: const BaseView(child: LoginView()));
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }
}

Container HomeBody() {
  return Container(
    height: 200,
    child: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(36),
                  bottomRight: Radius.circular(36)),
              color: kPrimaryColor),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: defaultPadding),
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            height: 54,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(27)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(0, 10),
                      blurRadius: 50)
                ]),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(
                      fontSize: defaultTextSize,
                      color: kTextColor.withOpacity(0.3)),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
        )
      ],
    ),
  );
}
