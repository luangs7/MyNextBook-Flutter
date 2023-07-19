import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/designsystem/common/lottie_states.dart';
import 'package:mynextbook/designsystem/components/base_view.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:mynextbook/modules/features/favorites/ui/favorite_item.dart';
import 'package:mynextbook/modules/features/favorites/viewmodel/favorites_view_model.dart';

import '../../../../designsystem/common/launch_url.dart';
import '../../../../designsystem/components/custombar/custom_appbar_provider.dart';
import '../../../../designsystem/components/lottie_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FavoritesView extends HookConsumerWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(favoritesViewModelProvider);
    final customBar = ref.read(customBarProvider);
    customBar.changeState(showBackButton: true, showActions: false);

    useEffect(() {
      viewModel.getFavoriteItems();
      return () {};
    }, []);

    return BaseView(
        child: viewModel.state.handleWidget(
            success: (data) {
              return listOfItems(data, (book) {
                viewModel.removeItem(book);
              });
            },
            error: (exception) {
              return const Center();
            },
            loading: () => const Center(child: CircularProgressIndicator()),
            empty: () => LottieView(
                  asset: lottieEmpty,
                  message: AppLocalizations.of(context).empty_favorites,
                )));
  }

  Widget listOfItems(List<Book> data, Function(Book) onFavorited) {
    return LayoutBuilder(builder: (context, constraints) {
      final ratio = MediaQuery.of(context).size.width /
          (MediaQuery.of(context).size.height / 1.3);
      return GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: ratio,
            crossAxisCount: constraints.maxWidth > 700
                ? 4
                : 2, // Number of columns in the grid
            mainAxisSpacing: 8 // Spacing between each row
            ),
        itemCount: data.length,
        itemBuilder: (context, index) {
          return FavoriteItem(
            book: data[index],
            onFavorited: (book) => onFavorited.call(book),
            onView: () {
              showUrl(data[index].previewLink ?? "");
            },
          );
        },
      );
    });
  }
}
