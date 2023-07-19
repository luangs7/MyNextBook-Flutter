import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/designsystem/components/base_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:mynextbook/modules/features/finder/preview/ui/preview_bottomsheet.dart';
import 'package:mynextbook/modules/features/finder/preview/ui/preview_item.dart';

import '../../../../../common/base/api_result.dart';
import '../../../../../designsystem/common/lottie_states.dart';
import '../../../../../designsystem/components/custombar/custom_appbar_provider.dart';
import '../../../../../designsystem/components/lottie_view.dart';
import '../viewmodel/preview_view_model.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PreviewView extends HookConsumerWidget {
  const PreviewView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(previewViewModelProvider);
    final customBar = ref.read(customBarProvider);
    customBar.changeState(showBackButton: true, showActions: true);

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
          children: [PreviewItem(book: book), PreviewBottomSheet(book: book)],
        );
      },
      error: (exception) {
        return LottieView(
            asset: lottieError,
            message: AppLocalizations.of(context).error_message);
      },
      loading: () {
        return LottieView(
            asset: lottieLoading,
            size: MediaQuery.of(context).size.height * 0.5);
      },
      empty: () {
        return LottieView(
            asset: lottieEmpty,
            message: AppLocalizations.of(context).empty_message);
      },
    ));
  }
}
