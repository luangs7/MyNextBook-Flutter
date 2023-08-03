import 'package:flutter/material.dart';
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
                  final prefes = data as AppPreferences;
                  ref.read(ebookProvider.notifier).state = prefes.isEbook;
                  ref.read(languageProvider.notifier).state =
                      prefes.isPortuguese;
                  _openDialog(context, prefes, (param) {
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

  void _openDialog(BuildContext context, AppPreferences preferences,
      Function(PreferencesParam) onConfirmation) {
    showDialog(
        context: context,
        barrierLabel: "",
        barrierDismissible: false,
        useSafeArea: false,
        builder: (_) {
          return FilterDialog(
              context: context,
              pref: preferences,
              ebookProvider: ebookProvider,
              languageProvider: languageProvider,
              onConfirmation: onConfirmation);
        });
  }
}
