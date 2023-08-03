import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:mynextbook/designsystem/components/base_view.dart';

import '../../../../designsystem/common/app_theme_text.dart';
import '../../../../designsystem/components/custombar/custom_appbar_provider.dart';
import '../../../../navigation/app_router.dart';
import '../../../domain/interactor/do_logout.dart';
import '../../../domain/model/app_preferences.dart';
import '../../finder/find/filter_dialog.dart';
import '../../preferences/model/preferences_param.dart';
import '../../preferences/viewmodel/preferences_view_model.dart';
import '../viewmodel/account_view_model.dart';
import 'message_dialog.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AccountView extends HookConsumerWidget {
  AccountView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    handleCustomBar(ref.read(customBarProvider), context);
    final AppRouter appRouter = GetIt.I.get();
    final viewModel = ref.watch(accountViewModelProvider);
    final prefViewModel = ref.watch(preferencesViewModelProvider);

    return BaseView(
        child: ListView(
      reverse: true,
      padding:
          const EdgeInsets.only(bottom: defaultPadding, top: defaultPadding),
      physics: const BouncingScrollPhysics(),
      children: [
        _itemList(AppLocalizations.of(context).logout,
            () => logout(context, appRouter)),
        _itemList(AppLocalizations.of(context).delete_account, () {
          viewModel.doDeleteAccount().then(
                (value) => showMessageDialog(
                    context: context,
                    message:
                        AppLocalizations.of(context).delete_account_message,
                    onConfirmation: () => logout(context, appRouter)),
              );
        }),
        _itemList(
            AppLocalizations.of(context).change_password,
            () => viewModel.doChangePassword().then((value) {
                  showMessageDialog(
                      context: context,
                      message:
                          AppLocalizations.of(context).change_password_message,
                      onConfirmation: () {});
                })),
        _itemList(AppLocalizations.of(context).my_favorites,
            () => favorites(context, appRouter)),
        _itemList(
            AppLocalizations.of(context).my_filter,
            () => prefViewModel.getAppPreferences().then((value) {
                  prefViewModel.getPreferenceState.handleState(success: (data) {
                    final prefes = data as AppPreferences;
                    ref.read(ebookProvider.notifier).state = prefes.isEbook;
                    ref.read(languageProvider.notifier).state =
                        prefes.isPortuguese;
                    _showFilter(context, prefes, (param) {
                      prefViewModel.onSetPreferences(param);
                    });
                  });
                })),
      ],
    ));
  }

  final ebookProvider = StateProvider((_) => false);
  final languageProvider = StateProvider((_) => false);

  Widget _itemList(String label, Function onTap) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Ink(
          decoration: BoxDecoration(
              border: Border.all(
                  color: Colors.black, width: 1, style: BorderStyle.solid),
              color: Colors.white.withOpacity(0.8),
              borderRadius: const BorderRadius.all(Radius.circular(27)),
              boxShadow: [
                BoxShadow(
                    color: Colors.black.withOpacity(0.5),
                    offset: const Offset(0, 10),
                    blurRadius: 20)
              ]),
          child: InkWell(
            customBorder: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(27),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Text(label,
                  textAlign: TextAlign.center,
                  style: AppTextTheme()
                      .h30
                      .bold()
                      .copyWith(color: Colors.black87)),
            ),
            onTap: () => onTap.call(),
          ),
        ));
  }

  handleCustomBar(CustomBarState customBar, BuildContext context) {
    customBar.changeState(
        showBackButton: true,
        showActions: false,
        title: AppLocalizations.of(context).my_account);
  }

  void logout(BuildContext context, AppRouter appRouter) async {
    final logout = GetIt.I.get<DoLogout>();
    await logout.execute();
    // ignore: use_build_context_synchronously
    appRouter.to(context, appRouter.loginView);
  }

  void favorites(BuildContext context, AppRouter appRouter) {
    appRouter.to(context, appRouter.favoriteView);
  }

  showMessageDialog(
      {required BuildContext context,
      required String message,
      required Function onConfirmation}) {
    showDialog(
      context: context,
      barrierLabel: "",
      barrierDismissible: true,
      builder: (context) {
        return MessageDialog(
            message: message,
            onConfirmation: () {
              onConfirmation.call();
            });
      },
    );
  }

  void _showFilter(BuildContext context, AppPreferences preferences,
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
