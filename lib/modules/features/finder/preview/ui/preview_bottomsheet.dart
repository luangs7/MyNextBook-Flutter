import 'package:flutter/material.dart';
import 'package:mynextbook/modules/features/finder/preview/ui/preview_item_information.dart';

import '../../../../domain/model/book.dart';

class PreviewBottomSheet extends StatelessWidget {
  final Book? book;

  const PreviewBottomSheet({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.7,
      minChildSize: 0.4,
      initialChildSize: 0.4,
      builder: (context, scrollController) {
        return ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(32)),
            child: Container(
              color: Colors.white,
              child: Padding(
                  padding: const EdgeInsets.only(
                      top: 16, left: 16, right: 16, bottom: 4),
                  child: ListView.builder(
                    physics: const ClampingScrollPhysics(),
                    controller: scrollController,
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Padding(
                            padding: const EdgeInsets.only(top: 4, bottom: 16),
                            child: Column(children: [
                              SizedBox(
                                  width: 50,
                                  child: Divider(
                                    color: Colors.grey.shade300,
                                    thickness: 5,
                                  ))
                            ]));
                      } else {
                        return PreviewItemInformation(book: book);
                      }
                    },
                  )),
            ));
      },
    );
  }
}
