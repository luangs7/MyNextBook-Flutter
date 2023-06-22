import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/designsystem/components/base_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mynextbook/modules/domain/model/book.dart';

import '../../../../../common/base/api_result.dart';
import '../../../../../designsystem/components/lottie_view.dart';
import '../viewmodel/preview_view_model.dart';

class PreviewView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(previewViewModelProvider);
    final isFavorited = useState(false);

    useEffect(() {
      viewModel.getBook();
      return () {
        viewModel.resetState();
      };
    }, []);

    useEffect(() {
      isFavorited.value = viewModel.previewState.state == ViewState.loading();
      return () {};
    }, [viewModel.previewState]);

    return BaseView(
        child: viewModel.previewState.state.handleWidget(
      success: (data) {
        return Stack(
          children: [
            Container(color: Colors.blueAccent),
            DraggableScrollableSheet(
              maxChildSize: 0.5,
              minChildSize: 0.3,
              builder: (context, scrollController) {
                return Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(18))),
                    child: Padding(
                        padding: const EdgeInsets.all(16),
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
                                castOrNull<Book>(data)?.description ?? "",
                                style: const TextStyle(color: Colors.black),
                              );
                            }
                          },
                        )));
              },
            )
          ],
        );
      },
      error: (exception) {
        return LottieView(
          asset: "lib/assets/lottie_error.json",
        );
      },
      loading: () {
        return LottieView(
          asset: "lib/assets/book_search.json",
        );
      },
      empty: () {
        return LottieView(
          asset: "lib/assets/lottie_empty.json",
        );
      },
    ));
  }
}
