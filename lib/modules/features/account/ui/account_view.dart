import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/common/utils/show_dialog.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:mynextbook/designsystem/components/base_view.dart';
import 'package:mynextbook/modules/features/account/ui/account_item_list.dart';

import '../../../../designsystem/common/app_theme_text.dart';
import '../../../../designsystem/components/custombar/custom_appbar_provider.dart';
import '../../../../navigation/app_router.dart';
import '../../../domain/interactor/do_logout.dart';
import '../../../domain/model/app_preferences.dart';
import '../../../../common/filter/filter_dialog.dart';
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

    return
      FutureBuilder(
        future: viewModel.getIsLogged(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return  BaseView(
                  child: ListView(
                    reverse: true,
                    padding:
                    const EdgeInsets.only(bottom: defaultPadding, top: defaultPadding),
                    physics: const BouncingScrollPhysics(),
                    children:
                      snapshot.data == true
                          ? buildLoggedList(ref, context, appRouter, viewModel, prefViewModel)
                          : [ AccountItemList(label: AppLocalizations.of(context).logout,
                          onTap: () => appRouter.to(context, appRouter.loginView)) ]
                  ));
            } else {
              return const Center();
            }
          });
  }

  final ebookProvider = StateProvider((_) => false);
  final languageProvider = StateProvider((_) => false);

  List<Widget> buildLoggedList(
      WidgetRef ref,
      BuildContext context,
      AppRouter appRouter,
      AccountViewModel viewModel,
      PreferencesViewModel prefViewModel
      ) {
    return [
      AccountItemList(label: AppLocalizations.of(context).logout,
              onTap: () => logout(context, appRouter)),
      AccountItemList(label: AppLocalizations.of(context).delete_account,
          onTap:  () {
            viewModel.doDeleteAccount().then(
                  (value) => _showMessageDialog(
                  context: context,
                  message:
                  AppLocalizations.of(context).delete_account_message,
                  onConfirmation: () => logout(context, appRouter)),
            );
          }),
      AccountItemList(label: AppLocalizations.of(context).change_password,
          onTap:() => viewModel.doChangePassword().then((value) {
            _showMessageDialog(
                context: context,
                message:
                AppLocalizations.of(context).change_password_message,
                onConfirmation: () {});
          })),
      AccountItemList(label: AppLocalizations.of(context).my_favorites,
          onTap: () => favorites(context, appRouter)),
      AccountItemList(label: AppLocalizations.of(context).my_favorites,
          onTap: () => prefViewModel.getAppPreferences().then((value) {
            prefViewModel.getPreferenceState.handleState(success: (data) {
              final prefers = data as AppPreferences;
              ref.read(ebookProvider.notifier).state = prefers.isEbook;
              ref.read(languageProvider.notifier).state =
                  prefers.isPortuguese;
              _showFilter(context, prefers, (param) {
                prefViewModel.onSetPreferences(param);
              });
            });
          }))
    ];
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
    appRouter.to(context, appRouter.recommendationView);
  }

  void favorites(BuildContext context, AppRouter appRouter) {
    appRouter.to(context, appRouter.favoriteView);
  }

  void _showMessageDialog(
      {required BuildContext context,
      required String message,
      required Function onConfirmation}) {
    dialog(
      context, MessageDialog(
            message: message,
            onConfirmation: () {
              onConfirmation.call();
            }));
  }

  void _showFilter(BuildContext context, AppPreferences preferences,
      Function(PreferencesParam) onConfirmation) {
    dialog(context, FilterDialog(
        context: context,
        pref: preferences,
        ebookProvider: ebookProvider,
        languageProvider: languageProvider,
        onConfirmation: onConfirmation));
  }
}
