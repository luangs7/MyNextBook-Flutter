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
import '../viewmodel/account_view_model.dart';
import 'message_dialog.dart';

class AccountView extends HookConsumerWidget {
  const AccountView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    handleCustomBar(ref.read(customBarProvider));
    final AppRouter appRouter = GetIt.I.get();
    final viewModel = ref.watch(accountViewModelProvider);

    return BaseView(
        child: ListView(
      reverse: true,
      padding:
          const EdgeInsets.only(bottom: defaultPadding, top: defaultPadding),
      physics: const BouncingScrollPhysics(),
      children: [
        _itemList("Sair", () => logout(context, appRouter)),
        _itemList("Deletar minha conta", () {
          viewModel.doDeleteAccount().then(
                (value) => showMessageDialog(
                    context: context,
                    message: "Sua conta foi deletada com sucesso! Até breve.",
                    onConfirmation: () => logout(context, appRouter)),
              );
        }),
        _itemList("Alterar senha", () => viewModel.doChangePassword().then((value) {
          showMessageDialog(
              context: context,
              message:
              "Enviamos uma mensagem para o email cadastrado para que a sua senha seja alterada.",
              onConfirmation: () {});
        })),
        Expanded(
          child: SizedBox(height: MediaQuery.of(context).size.height * 0.1),
        ),
        _itemList("Meus favoritos", () => favorites(context, appRouter)),
      ],
    ));
  }

  Widget _itemList(String label, Function onTap) {
    return Padding(
        padding: const EdgeInsets.all(8),
        child: Ink(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1, style: BorderStyle.solid),
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
                  style:
                      AppTextTheme().h30.bold().copyWith(color: Colors.black87)),
            ),
            onTap: () => onTap.call(),
          ),
        ));
  }

  handleCustomBar(CustomBarState customBar) {
    customBar.changeState(
        showBackButton: true, showActions: false, title: "Minha conta");
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
            message: message, onConfirmation: () {
               onConfirmation.call();
        });
      },
    );
  }
}
