import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:mynextbook/designsystem/common/app_theme.dart';
import 'package:mynextbook/designsystem/common/app_theme_text.dart';
import 'package:mynextbook/designsystem/components/item_action.dart';

class FavoriteItem extends HookConsumerWidget {
  const FavoriteItem({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.all(defaultPaddingV),
      child: SizedBox(
        width: 90,
        child: Column(
          children: [
            itemImage(
                'http://books.google.com/books/content?id=qluXBAAAQBAJ&printsec=frontcover&img=1&zoom=1&edge=curl&source=gbs_api'),
            const Padding(padding: EdgeInsets.only(top: defaultPaddingV)),
            itemTitle(
                "Harry Potter e os Enigmas do Principe Part II A vinganca continua"),
            const Padding(padding: EdgeInsets.only(top: defaultPadding)),
            itemActions(false, () {}, () {})
          ],
        ),
      ),
    );
  }

  Widget itemImage(String image) {
    return ClipRRect(
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: CachedNetworkImage(
        imageUrl: image,
        placeholder: (context, url) => const SizedBox(
            height: 20, width: 20, child: CircularProgressIndicator()),
        errorWidget: (context, url, error) {
          return const Icon(Icons.error);
        },
      ),
    );
  }

  Widget itemTitle(String label) {
    return Consumer(builder: ((context, ref, child) {
      var theme = ref.watch(appThemeProvider);
      return Text(label,
          style: AppTextTheme()
              .h20
              .copyWith(color: theme.appColors.textColor.withOpacity(0.5)),
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis);
    }));
  }

  Widget itemActions(
      bool isFavorited, Function onFavorited, Function onShared) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ItemAction(
            height: 32.0,
            width: 32.0,
            accent: isFavorited ? Colors.red : Colors.white,
            onClick: onFavorited),
        const Padding(padding: EdgeInsets.all(4)),
        ItemAction(
            height: 32.0, width: 32.0, accent: Colors.white, onClick: onShared)
      ],
    );
  }
}
