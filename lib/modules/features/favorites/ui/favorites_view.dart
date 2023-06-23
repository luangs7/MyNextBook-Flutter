import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:lottie/lottie.dart';
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

import '../../../../designsystem/components/custombar/custom_appbar_provider.dart';
import '../../../../designsystem/components/lottie_view.dart';

class FavoritesView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(favoritesViewModelProvider);
    final customBar = ref.read(customBarProvider);
    customBar.showBackButton = true;
    customBar.showActions = false;
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
            empty: () => LottieView(
                  asset: "lib/assets/lottie_empty.json",
                  message: "Você ainda não favoritou nenhum livro.",
                )));
  }

  Widget listOfItems(List<Book> data) {
    return Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Number of columns in the grid
            mainAxisSpacing: 4, // Spacing between each row
            crossAxisSpacing: 4,
          ),
          itemCount: data.length,
          itemBuilder: (context, index) {
          return FavoriteItem(book: data[index]);
          },

        ));
  }
}
