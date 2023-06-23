import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../common/base/api_result.dart';
import '../../../../domain/model/book.dart';

class PreviewBottomSheet extends StatelessWidget {
  final String description;

  const PreviewBottomSheet({super.key, required this.description});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      maxChildSize: 0.6,
      minChildSize: 0.25,
      initialChildSize: 0.25,
      builder: (context, scrollController) {
        return ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(8)),
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
                            padding: const EdgeInsets.all(8),
                            child: Column(children: [
                              SizedBox(
                                  width: 50,
                                  child: Divider(
                                    color: Colors.grey.shade300,
                                    thickness: 5,
                                  ))
                            ]));
                      } else {
                        return Text(
                          description,
                          style: const TextStyle(color: Colors.black),
                        );
                      }
                    },
                  )),
            ));
      },
    );
  }
}
