import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/components/item_title_grid.dart';
import '../../../../designsystem/components/item_action_container.dart';
import '../../../../designsystem/components/item_image.dart';
import '../../../domain/model/book.dart';

class FavoriteItem extends HookConsumerWidget {
  final Book book;
  final Function onFavorited;
  final Function onView;

  const FavoriteItem(
      {super.key,
      required this.book,
      required this.onFavorited,
      required this.onView});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width * 0.3;
    final height = MediaQuery.of(context).size.width * 0.45;
    return Wrap(
      alignment: WrapAlignment.center,
      children: [
        ItemImage(
          height: height,
          width: width,
          url: book.imageLinks?.thumbnail ?? "",
        ),
        ItemTitleGrid(label: book.title ?? ""),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: ItemActionContainer(
            itemSize: 28,
            isFavorited: true,
            onFavorited: () => onFavorited.call(book),
            onView: onView,
          ),
        )
      ],
    );
  }
}
