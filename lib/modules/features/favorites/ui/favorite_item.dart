import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
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
    const width = 140.0;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        ItemImage(
          height: width * 1.5,
          width: width,
          url: book.imageLinks?.thumbnail ?? "",
        ),
        const SizedBox(height: defaultPaddingV),
        ItemActionContainer(
          itemSize: 32,
          isFavorited: true,
          onFavorited: () => onFavorited.call(book),
          onShared: null,
          onView: onView,
        )
      ],
    );
  }
}
