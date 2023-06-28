import 'package:flutter/material.dart';

import 'item_action.dart';

class ItemActionContainer extends StatelessWidget {
  final double itemSize;
  final bool isFavorited;
  final Function onFavorited;
  final Function? onShared;
  final Function onView;

  const ItemActionContainer(
      {super.key,
      required this.itemSize,
      required this.isFavorited,
      required this.onFavorited,
      required this.onShared,
      required this.onView});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ItemAction(
            icon: Icons.favorite,
            height: itemSize,
            width: itemSize,
            accent: isFavorited ? Colors.red : Colors.white,
            onClick: onFavorited),
        const Padding(padding: EdgeInsets.all(6)),
        ItemAction(
            icon: Icons.remove_red_eye,
            height: itemSize,
            width: itemSize,
            accent: Colors.white,
            onClick: onView),
        const Padding(padding: EdgeInsets.all(6)),
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
