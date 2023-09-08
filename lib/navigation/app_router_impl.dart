import 'package:flutter/material.dart';
import 'package:mynextbook/modules/features/favorites/ui/favorites_view.dart';
import 'package:mynextbook/modules/features/home/ui/home_view.dart';
import 'package:mynextbook/modules/features/login/ui/login_view.dart';
import 'package:mynextbook/modules/features/recommendation/ui/recommendation_view.dart';
import 'package:mynextbook/navigation/app_router.dart';

import '../modules/features/account/ui/account_view.dart';
import '../modules/features/finder/ui/find_view.dart';
import '../modules/features/preview/ui/preview_view.dart';

class AppRouterImpl extends AppRouter {
  @override
  Map<String, WidgetBuilder> createRouter(BuildContext context) {
    return {
      welcomeView: (context) => const HomeView(),
      finderView: (context) => FindView(),
      favoriteView: (context) => const FavoritesView(),
      previewView: (context) => const PreviewView(),
      loginView: (context) => const LoginView(),
      accountView: (context) => AccountView(),
      recommendationView: (context) => const RecommendationView(),
    };
  }

  @override
  void pop(BuildContext context, {bool reload = false}) {
    if (reload) {
      Navigator.pop(context, "reload");
    } else {
      Navigator.pop(context);
    }
  }

  @override
  void popTo(BuildContext context, String route) {
    Navigator.of(context).popUntil((current) {
      return current.settings.name == route;
    });
  }

  @override
  void to(BuildContext context, String route,
      {bool replace = false, String? params}) {
    if (replace) {
      Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
    } else {
      Navigator.of(context).pushNamed(route, arguments: params);
    }
  }
}
