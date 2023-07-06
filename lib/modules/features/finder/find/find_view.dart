import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/designsystem/components/information_view.dart';
import 'package:mynextbook/modules/domain/model/app_preferences.dart';
import 'package:mynextbook/modules/features/preferences/model/preferences_param.dart';
import 'package:mynextbook/modules/features/preferences/viewmodel/preferences_view_model.dart';
import 'package:mynextbook/navigation/app_router.dart';
import 'package:mynextbook/modules/features/finder/find/filter_dialog.dart';

import '../../../../designsystem/common/lottie_states.dart';
import '../../../../designsystem/components/base_view.dart';
import '../../../../designsystem/components/custombar/custom_appbar_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class FindView extends HookConsumerWidget {
  FindView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(preferencesViewModelProvider);
    final textController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final customBar = ref.read(customBarProvider);
    customBar.changeState(showBackButton: true, showActions: true);
    final AppRouter appRouter = GetIt.I.get();
    return BaseView(
        child: InformationView(
            title: AppLocalizations.of(context).information_filter_title,
            buttonTitle: AppLocalizations.of(context).btn_search,
            lottieAnimation: lottiePreferences,
            subtitle: AppLocalizations.of(context).information_filter_subtitle,
            onInformation: () {
              viewModel.getAppPreferences().then((value) {
                viewModel.getPreferenceState.handleState(success: (data) {
                  onInitValues(data as AppPreferences, ref, textController);
                  _openDialog(context, textController, (param) {
                    viewModel.onSetPreferences(param);
                  });
                });
              });
            },
            onNext: () {
              appRouter.to(context, appRouter.previewView);
            }));
  }

  final ebookProvider = StateProvider((_) => false);
  final languageProvider = StateProvider((_) => false);

  void onInitValues(AppPreferences pref, WidgetRef ref,
      TextEditingController textController) {
    ref.read(ebookProvider.notifier).state = pref.isEbook;
    ref.read(languageProvider.notifier).state = pref.isPortuguese;
    textController.text = pref.keyword ?? "";
  }

  void _openDialog(BuildContext context, TextEditingController textController,
      Function(PreferencesParam) onConfirmation) {
    showGeneralDialog(
        context: context,
        barrierLabel: "",
        barrierDismissible: true,
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, __, ___) {
          return FilterDialog(
              context: context,
              textController: textController,
              onConfirmation: onConfirmation,
              ebookProvider: ebookProvider,
              languageProvider: languageProvider);
        });
  }
}
