import 'package:flutter/material.dart';
import 'package:mynextbook/navigation/app_router.dart';

extension CustomAppBar on AppBar {
  AppBar buildAppBar(BuildContext context, AppRouter appRouter,
      {bool showActions = true, showBackButton = true}) {
    return AppBar(
      automaticallyImplyLeading: showBackButton,
      actions: [
        showActions
            ? MaterialButton(
                shape: const CircleBorder(),
                clipBehavior: Clip.hardEdge,
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                  size: 24.0,
                  semanticLabel: 'Favoritos',
                ),
                onPressed: () {
                  appRouter.to(context, appRouter.favoriteView);
                },
              )
            : const Center(),
      ],
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }
}
