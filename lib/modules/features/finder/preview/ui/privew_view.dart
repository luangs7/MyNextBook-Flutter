import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/designsystem/components/base_view.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../viewmodel/preview_view_model.dart';

class PreviewView extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(previewViewModelProvider);
    final randomLoading = useState(false);
    final isFavorited = useState(false);

    useEffect(() {
      viewModel.getBook();

      return () {};
    }, []);

    useEffect(() {
      viewModel.previewState.state.handleState(
          loading: () => randomLoading.value = true,
          success: (data) {
            randomLoading.value = false;
          },
          error: (error) {
            print(error.toString());
          });

      isFavorited.value = viewModel.previewState.state == ViewState.loading();
      return () {};
    }, [viewModel.previewState]);

    return BaseView(
        child: randomLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Container());
  }
}
