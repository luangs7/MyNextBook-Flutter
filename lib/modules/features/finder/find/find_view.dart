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
import 'package:mynextbook/designsystem/components/custom_appbar.dart';
import 'package:mynextbook/modules/features/finder/find/filter_dialog.dart';

class FindView extends HookConsumerWidget {
  FindView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final viewModel = ref.watch(preferencesViewModelProvider);
    final textController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    final AppRouter appRouter = GetIt.I.get();
    return Scaffold(
        appBar: AppBar().buildAppBar(context, appRouter),
        body: SingleChildScrollView(
            child: InformationView(
                title:
                    "Você pode utilizar alguns filtros para ajudar\nna nossa busca",
                buttonTitle: "Buscar",
                lottieAnimation: "book_preferences",
                subtitle: "Basta clicar aqui para alterar suas preferências.",
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
                })));
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
