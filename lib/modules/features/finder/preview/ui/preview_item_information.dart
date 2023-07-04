import 'package:flutter/material.dart';

import '../../../../../designsystem/common/app_constants.dart';
import '../../../../../designsystem/common/app_theme_text.dart';
import '../../../../../designsystem/components/item_title.dart';
import '../../../../domain/model/book.dart';

class PreviewItemInformation extends StatelessWidget {
  final Book? book;

  const PreviewItemInformation({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      ItemTitle(label: book?.title ?? ""),
      const SizedBox(height: defaultPadding),
      if (book?.subtitle != null)
        Text(
          book?.subtitle ?? "",
          textAlign: TextAlign.center,
          style: AppTextTheme()
              .h20
              .copyWith(color: Colors.black.withOpacity(0.4))
              .bold(),
        ),
      if (book?.subtitle != null) const SizedBox(height: defaultPadding),
      Text(
        book?.description ?? "",
        style: AppTextTheme()
            .h20
            .copyWith(color: Colors.black.withOpacity(0.7))
            .dense(),
      )
    ]);
  }
}
