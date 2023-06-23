import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:mynextbook/designsystem/common/app_theme.dart';
import '../../../../designsystem/components/item_action_container.dart';
import '../../../../designsystem/components/item_image.dart';
import '../../../../designsystem/components/item_title.dart';
import '../../../domain/model/book.dart';

class FavoriteItem extends HookConsumerWidget {
  final Book book;

  const FavoriteItem({super.key, required this.book});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appTheme = ref.watch(appThemeProvider);
    return Padding(
      padding: const EdgeInsets.all(defaultPaddingV),
      child: IntrinsicWidth(
        child: Container(
          padding: const EdgeInsets.all(0) ,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                child: ItemImage(
                    url: book.imageLinks?.thumbnail ?? ""),
              ),
              const Padding(padding: EdgeInsets.only(top: defaultPaddingV)),
              ItemActionContainer(
                itemSize: 32,
                isFavorited: false,
                onFavorited: () {},
                onShared: () {},
                onView: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
