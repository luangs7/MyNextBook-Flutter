import 'package:flutter/material.dart';
import 'package:mynextbook/navigation/app_router.dart';

import '../../common/app_theme_text.dart';

extension CustomAppBar on AppBar {
  AppBar buildAppBar(BuildContext context, AppRouter appRouter,
      {String title = "", bool showActions = true, showBackButton = true}) {
    return AppBar(
      title: Text(
        style: AppTextTheme().h40.dense(),
        title,
        textAlign: TextAlign.center,
      ),
      automaticallyImplyLeading: showBackButton,
      actions: showActions
          ? [Row(children: createActions(context, appRouter))]
          : [const Center()],
      elevation: 0,
      backgroundColor: Colors.transparent,
    );
  }

  List<Widget> createActions(BuildContext context, AppRouter appRouter) {
    return [
      GestureDetector(
        child: const Padding(
            padding: EdgeInsets.all(8),
            child: Icon(
              Icons.person,
              color: Colors.white,
              size: 36.0,
              semanticLabel: 'Account',
            )),
        onTap: () {
          appRouter.to(context, appRouter.accountView);
        },
      )
    ];
  }
}
