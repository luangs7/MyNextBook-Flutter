import 'package:flutter/material.dart';

import 'item_action.dart';

class ItemActionContainer extends StatelessWidget {
  final double itemSize;
  final bool isFavorited;
  final Function onFavorited;
  final Function? onShared;
  final Function onView;
  final Function? onRefresh;

  const ItemActionContainer(
      {super.key,
      required this.itemSize,
      required this.isFavorited,
      required this.onFavorited,
      this.onRefresh,
      this.onShared,
      required this.onView});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (onRefresh != null)
          ItemAction(
              icon: Icons.refresh,
              height: itemSize,
              width: itemSize,
              accent: Colors.white,
              onClick: onRefresh!),
        if (onRefresh != null)
          const SizedBox(
            width: 8,
          ),
        ItemAction(
            icon: Icons.favorite,
            height: itemSize,
            width: itemSize,
            accent: isFavorited ? Colors.red : Colors.white,
            onClick: onFavorited),
        const SizedBox(
          width: 8,
        ),
        ItemAction(
            icon: Icons.remove_red_eye,
            height: itemSize,
            width: itemSize,
            accent: Colors.white,
            onClick: onView),
        if (onShared != null)
          const SizedBox(
            width: 8,
          ),
        if (onShared != null)
          ItemAction(
              icon: Icons.share,
              height: itemSize,
              width: itemSize,
              accent: Colors.white,
              onClick: onShared!)
      ],
    );
  }
}
