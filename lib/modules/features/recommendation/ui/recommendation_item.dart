import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import '../../../../designsystem/common/app_theme_text.dart';
import '../../../../designsystem/components/item_image.dart';
import '../../../domain/model/book.dart';

class RecommendationItem extends HookConsumerWidget {
  final Book book;
  final Function(Book) onDetails;

  const RecommendationItem(
      {super.key, required this.book, required this.onDetails});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width * 0.3;
    final height = MediaQuery.of(context).size.width * 0.45;
    return GestureDetector(
      child: Wrap(
        alignment: WrapAlignment.center,
        children: [
          ItemImage(
            height: height,
            width: width,
            url: book.imageLinks?.thumbnail ?? "",
          ),
          Padding(
              padding: const EdgeInsets.only(top: defaultPaddingV),
              child: Text(book.title ?? "",
                  style:
                      AppTextTheme().h20.copyWith(color: Colors.white70).bold(),
                  textAlign: TextAlign.center,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis)),
        ],
      ),
      onTap: () {
        onDetails.call(book);
      },
    );
  }
}
