import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/components/custombar/custom_appbar.dart';
import 'package:mynextbook/modules/cloudservices/auth/cloudservices_auth.dart';
import 'package:mynextbook/modules/domain/interactor/do_logout.dart';
import 'package:mynextbook/navigation/app_router.dart';

import 'custombar/custom_appbar_provider.dart';

class BaseView extends HookConsumerWidget {
  const BaseView({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppRouter appRouter = GetIt.I.get();
    final customBar = ref.watch(customBarProvider);

    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: customBar.resizeToAvoidBottomInset,
      appBar: AppBar().buildAppBar(
        context,
        appRouter,
        () {
          logout(context, appRouter);
        },
        showBackButton: customBar.showBackButton,
        showActions: customBar.showActions,
      ),
      body: child,
    ));
  }

  void logout(BuildContext context, AppRouter appRouter) async {
    final logout = GetIt.I.get<DoLogout>();
    await logout.execute();
    // ignore: use_build_context_synchronously
    appRouter.to(context, appRouter.loginView);
  }
}
