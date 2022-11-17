import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:mynextbook/designsystem/common/app_theme.dart';
import 'package:mynextbook/designsystem/common/app_theme_text.dart';
import 'package:mynextbook/designsystem/components/custom_appbar.dart';
import 'package:mynextbook/modules/features/favorites/ui/favorite_item.dart';
import 'package:mynextbook/navigation/app_router.dart';

class FavoritesView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    AppRouter appRouter = GetIt.I.get();
    var theme = ref.watch(appThemeProvider);
    var items = List.from(["1", "2", "3", "1", "2"]);
    return Scaffold(
        appBar: AppBar().buildAppBar(context, appRouter, showActions: false),
        body: Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Wrap(
              runAlignment: WrapAlignment.start,
              children: items.map((e) => FavoriteItem()).toList(),
            )));
  }
}
