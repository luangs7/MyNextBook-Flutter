import 'package:flutter/material.dart';
import 'package:mynextbook/navigation/app_router.dart';

extension CustomAppBar on AppBar {
  AppBar buildAppBar(
      BuildContext context, AppRouter appRouter, Function onLogout,
      {bool showActions = true, showBackButton = true}) {
    return AppBar(
      automaticallyImplyLeading: showBackButton,
      actions: showActions
          ? [Row(children: createActions(context, appRouter, onLogout))]
          : [const Center()],
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  List<Widget> createActions(
      BuildContext context, AppRouter appRouter, Function onLogout) {
    return [
      GestureDetector(
        child: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.favorite,
              color: Colors.white,
              size: 24.0,
              semanticLabel: 'Favoritos',
            )),
        onTap: () {
          appRouter.to(context, appRouter.favoriteView);
        },
      ),
      const SizedBox(width: 16),
      GestureDetector(
        child: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.exit_to_app,
              color: Colors.white,
              size: 24.0,
              semanticLabel: 'Logout',
            )),
        onTap: () {
          onLogout();
        },
      )
    ];
  }
}
