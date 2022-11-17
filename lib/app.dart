import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/app_colors.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:mynextbook/designsystem/common/app_theme.dart';
import 'package:mynextbook/modules/data/datastore/di/book_datastore_module.dart';
import 'package:mynextbook/modules/data/remote/di/book_remote_module.dart';
import 'package:mynextbook/modules/data/local/di/book_local_module.dart';
import 'package:mynextbook/modules/data/repository/di/book_repository_module.dart';
import 'package:mynextbook/modules/domain/di/domain_module.dart';
import 'package:mynextbook/modules/features/home/ui/home_view.dart';
import 'package:mynextbook/navigation/di/navigation_module.dart';
import 'package:mynextbook/navigation/app_router.dart';

void startApp() async {
  await _initApp();
  runApp(ProviderScope(child: MyApp()));
}

Future _initApp() async {
  _initialiseGetIt();
}

void _initialiseGetIt() {
  GetIt.instance
    ..datastoreModule()
    ..bookLocalModule()
    ..bookRepositoryModule()
    ..remoteModule()
    ..domainModule()
    ..navigationModule();
}

class MyApp extends HookConsumerWidget {
  MyApp({super.key});

  final AppRouter appRouter = GetIt.I.get();
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = ref.watch(appThemeProvider);
    final themeMode = ref.watch(appThemeModeProvider);
    return MaterialApp(
        initialRoute: appRouter.welcomeView,
        routes: appRouter.createRouter(context),
        theme: theme.data,
        themeMode: themeMode,
        darkTheme: AppTheme.dark().data,
        home: const SafeArea(child: HomeView()));
  }
}

Container HomeBody() {
  return Container(
    height: 200,
    child: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(36), bottomRight: Radius.circular(36)),
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
                  BoxShadow(color: Colors.black.withOpacity(0.5), offset: const Offset(0, 10), blurRadius: 50)
                ]),
            child: TextField(
              decoration: InputDecoration(
                  hintText: "Search",
                  hintStyle: TextStyle(fontSize: defaultTextSize, color: kTextColor.withOpacity(0.3)),
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none),
            ),
          ),
        )
      ],
    ),
  );
}
