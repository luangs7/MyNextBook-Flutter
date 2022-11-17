import 'package:flutter/material.dart';
import 'package:mynextbook/modules/features/favorites/ui/favorites_view.dart';
import 'package:mynextbook/modules/features/finder/find/find_view.dart';
import 'package:mynextbook/modules/features/home/ui/home_view.dart';
import 'package:mynextbook/navigation/app_router.dart';

class AppRouterImpl extends AppRouter {
  @override
  Map<String, WidgetBuilder> createRouter(BuildContext context) {
    return {
      welcomeView: (context) => const HomeView(),
      finderView: (context) => FindView(),
      favoriteView: (context) => FavoritesView(),
      previewView: (context) => const HomeView(),
    };
  }

  @override
  void pop(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  void popTo(BuildContext context, String route) {
    Navigator.of(context).popUntil((current) {
      return current.settings.name == route;
    });
  }

  @override
  void to(BuildContext context, String route, {String? params}) {
    Navigator.pushNamed(context, route, arguments: params);
  }
}
