import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    final width = MediaQuery.of(context).size.width * 0.4;
    final height = MediaQuery.of(context).size.width * 0.6;
    return Wrap(
      children: [
        ItemImage(
          height: height,
          width: width,
          url: book.imageLinks?.thumbnail ?? "",
        ),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: ItemActionContainer(
            itemSize: 32,
            isFavorited: true,
            onFavorited: () => onFavorited.call(book),
            onShared: null,
            onView: onView,
          ),
        )
      ],
    );
  }
}
