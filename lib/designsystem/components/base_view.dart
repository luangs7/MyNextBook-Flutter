import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/components/custombar/custom_appbar.dart';
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
      appBar: _buildAppBar(appRouter, context, customBar),
      body: child,
    ));
  }

  PreferredSizeWidget? _buildAppBar(
      AppRouter appRouter, BuildContext context, CustomBarState customBar) {
    if (customBar.isVisible) {
      return AppBar().buildAppBar(context, appRouter,
          showBackButton: customBar.showBackButton,
          showActions: customBar.showActions,
          title: customBar.title);
    } else {
      return null;
    }
  }
}
