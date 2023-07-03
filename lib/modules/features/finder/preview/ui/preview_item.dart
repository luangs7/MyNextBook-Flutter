import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/launch_url.dart';
import 'package:mynextbook/modules/features/finder/preview/viewmodel/preview_view_model.dart';

import '../../../../../designsystem/components/item_action_container.dart';
import '../../../../../designsystem/components/item_image.dart';
import '../../../../../designsystem/components/item_title.dart';
import '../../../../domain/model/book.dart';

class PreviewItem extends HookConsumerWidget {
  final Book? book;

  const PreviewItem({super.key, required this.book});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(previewViewModelProvider);
    if (book != null) {
      book!.isFavorited = viewModel.itemFavoriteState;
      return Column(
        children: [
          ItemImage(
              url: book!.imageLinks?.thumbnail ?? "",
              width: MediaQuery.of(context).size.height * 0.2,
              height: MediaQuery.of(context).size.height * 0.3),
          Padding(
              padding: const EdgeInsets.all(20),
              child: ItemTitle(label: book!.title ?? "")),
          ItemActionContainer(
            itemSize: 42,
            isFavorited: viewModel.itemFavoriteState,
            onFavorited: () {
              viewModel.setFavoriteBook(book!);
            },
            onShared: () {
              share(context, book?.previewLink ?? "");
            },
            onView: () {
              showUrl(book?.previewLink ?? "");
            },
          ),
        ],
      );
    } else {
      return const Center();
    }
  }
}
