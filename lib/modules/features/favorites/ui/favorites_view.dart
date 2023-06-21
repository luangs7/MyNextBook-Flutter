import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:mynextbook/designsystem/components/base_view.dart';
import 'package:mynextbook/designsystem/components/custombar/custom_appbar.dart';
import 'package:mynextbook/modules/data/local/dao/book_dao.dart';
import 'package:mynextbook/modules/data/local/mapper/book_entity_mapper.dart';
import 'package:mynextbook/modules/data/repository/datasource/book_data_source_local.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:mynextbook/modules/features/favorites/ui/favorite_item.dart';
import 'package:mynextbook/modules/features/favorites/viewmodel/favorites_view_model.dart';
import 'package:mynextbook/navigation/app_router.dart';

class FavoritesView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(favoritesViewModelProvider);

    AppRouter appRouter = GetIt.I.get();

    useEffect(() {
      viewModel.getFavoriteItems();
      return () {};
    }, []);

    return BaseView(
        child: viewModel.state.handleWidget(
            success: (data) {
              return listOfItems(data);
            },
            error: (exception) {
              return const Center();
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            empty: () => const Center()));
  }

  Widget listOfItems(List<Book> data) {
    return Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: Wrap(
          runAlignment: WrapAlignment.start,
          children: data.map((e) => FavoriteItem(book: e)).toList(),
        ));
  }
}
