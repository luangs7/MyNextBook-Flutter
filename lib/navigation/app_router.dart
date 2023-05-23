import 'package:flutter/material.dart';

abstract class AppRouter {
  final String welcomeView = "/welcome_view";
  final String finderView = "/finder_view";
  final String previewView = "/preview_view";
  final String favoriteView = "/favorite_view";
  final String loginView = "/login_view";

  Map<String, WidgetBuilder> createRouter(BuildContext context);
  void to(BuildContext context, String route, {bool replace, String? params});
  void pop(BuildContext context);
  void popTo(BuildContext context, String route);
}
