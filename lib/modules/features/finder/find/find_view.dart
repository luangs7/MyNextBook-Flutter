import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/app_colors.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:mynextbook/designsystem/common/app_theme.dart';
import 'package:mynextbook/designsystem/common/app_theme_text.dart';
import 'package:mynextbook/designsystem/components/custom_button.dart';
import 'package:mynextbook/designsystem/components/custom_checkbok.dart';
import 'package:mynextbook/designsystem/components/information_view.dart';
import 'package:mynextbook/navigation/app_router.dart';
import 'package:mynextbook/designsystem/components/custom_appbar.dart';

class FindView extends HookConsumerWidget {
  FindView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppRouter appRouter = GetIt.I.get();
    return Scaffold(
        appBar: AppBar().buildAppBar(context, appRouter),
        body: InformationView(
            title: "Você pode utilizar alguns filtros para ajudar\nna nossa busca",
            buttonTitle: "Buscar",
            lottieAnimation: "book_preferences",
            subtitle: "Basta clicar aqui para alterar suas preferências.",
            onInformation: () {
              _openDialog(context);
            },
            onNext: () {
              appRouter.to(context, appRouter.previewView);
            }));
  }

  final ebookProvider = StateProvider((_) => false);
  final languageProvider = StateProvider((_) => false);

  void _openDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierLabel: "",
        barrierDismissible: true,
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, __, ___) {
          return Scaffold(
              resizeToAvoidBottomInset: false,
              backgroundColor: Colors.black.withOpacity(0.2),
              body: Consumer(builder: (context, ref, child) {
                var theme = ref.watch(appThemeProvider);
                return Center(
                    child: Wrap(children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                      child: Container(
                          padding: const EdgeInsets.all(defaultPadding),
                          decoration: BoxDecoration(
                              color: theme.appColors.background,
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black.withOpacity(0.5), offset: const Offset(0, 10), blurRadius: 50),
                              ],
                              borderRadius: const BorderRadius.all(Radius.circular(8))),
                          child: Column(
                            children: [
                              CustomCheckbox(
                                label: "Apenas Ebook",
                                provider: ebookProvider,
                              ),
                              CustomCheckbox(
                                label: "Apenas Português",
                                provider: languageProvider,
                              ),
                              TextField(
                                decoration: InputDecoration(
                                    hintText: "Insira uma palavra-chave",
                                    hintStyle: TextStyle(
                                        fontSize: defaultTextSize, color: theme.appColors.textColor.withOpacity(0.3)),
                                    enabledBorder: InputBorder.none,
                                    focusedBorder: InputBorder.none),
                              ),
                              CustomButton(
                                  title: "Salvar",
                                  onPressed: () {
                                    Navigator.pop(context);
                                  })
                            ],
                          )))
                ]));
              }));
        });
  }
}
