import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/launch_url.dart';
import 'package:mynextbook/modules/features/preview/viewmodel/preview_view_model.dart';

import '../../../../common/utils/show_dialog.dart';
import '../../../../designsystem/components/information_dialog.dart';
import '../../../../designsystem/components/item_action_container.dart';
import '../../../../designsystem/components/item_image.dart';
import '../../../../navigation/app_router.dart';
import '../../../domain/model/book.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PreviewItem extends HookConsumerWidget {
  final Book? book;
  final Function? onRefresh;
  const PreviewItem({super.key, required this.book, required this.onRefresh});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(previewViewModelProvider);
    final AppRouter appRouter = GetIt.I.get();

    if (book != null) {
      book!.isFavorited = viewModel.itemFavoriteState;
      return Column(
        children: [
          ItemImage(
              url: book!.imageLinks?.thumbnail ?? "",
              width: MediaQuery.of(context).size.width * 0.55,
              height: MediaQuery.of(context).size.height * 0.4),
          Padding(
              padding: const EdgeInsets.all(20),
              child: ItemActionContainer(
                itemSize: 42,
                isFavorited: viewModel.itemFavoriteState,
                onFavorited: () {
                  viewModel.getUser().then((value) {
                    if (value != null) {
                      viewModel.setFavoriteBook(book!);
                    } else {
                      dialog(
                          context,
                          InformationDialog(
                            message:
                                AppLocalizations.of(context).login_information,
                            buttonLabel: "Ok",
                            onClick: () {
                              appRouter.to(context, appRouter.loginView);
                            },
                          ));
                    }
                  });
                },
                onShared: () {
                  share(context, book?.previewLink ?? "");
                },
                onView: () {
                  showUrl(book?.previewLink ?? "");
                },
                onRefresh: onRefresh,
              )),
        ],
      );
    } else {
      return const Center();
    }
  }
}
