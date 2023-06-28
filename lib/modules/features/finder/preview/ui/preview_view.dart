import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/designsystem/components/base_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:mynextbook/modules/features/finder/preview/ui/preview_bottomsheet.dart';
import 'package:mynextbook/modules/features/finder/preview/ui/preview_item.dart';

import '../../../../../common/base/api_result.dart';
import '../../../../../designsystem/components/custombar/custom_appbar_provider.dart';
import '../../../../../designsystem/components/lottie_view.dart';
import '../viewmodel/preview_view_model.dart';

class PreviewView extends HookConsumerWidget {
  const PreviewView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(previewViewModelProvider);
    final customBar = ref.read(customBarProvider);
    customBar.showBackButton = true;
    customBar.showActions = true;
    useEffect(() {
      viewModel.getBook();
      return () {
        viewModel.resetState();
      };
    }, []);

    return BaseView(
        child: viewModel.previewState.state.handleWidget(
      success: (data) {
        final book = castOrNull<Book>(data);
        return Stack(
          children: [
            PreviewItem(book: book),
            PreviewBottomSheet(description: book?.description ?? "")
          ],
        );
      },
      error: (exception) {
        return const LottieView(
          asset: "lib/assets/lottie_error.json",
        );
      },
      loading: () {
        return const LottieView(
          asset: "lib/assets/book_search.json",
        );
      },
      empty: () {
        return const LottieView(
          asset: "lib/assets/lottie_empty.json",
        );
      },
    ));
  }
}
