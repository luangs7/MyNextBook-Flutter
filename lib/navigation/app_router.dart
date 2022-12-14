import 'package:flutter/material.dart';

abstract class AppRouter {
  final String welcomeView = "/welcome_view";
  final String finderView = "/finder_view";
  final String previewView = "/preview_view";
  final String favoriteView = "/favorite_view";

  Map<String, WidgetBuilder> createRouter(BuildContext context);
  void to(BuildContext context, String route, {String? params});
  void pop(BuildContext context);
  void popTo(BuildContext context, String route);
}
