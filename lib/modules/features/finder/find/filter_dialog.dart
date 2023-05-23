import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:mynextbook/designsystem/common/app_theme.dart';
import 'package:mynextbook/designsystem/components/custom_button.dart';
import 'package:mynextbook/designsystem/components/custom_checkbok.dart';
import 'package:mynextbook/modules/features/preferences/model/preferences_param.dart';

class FilterDialog extends HookConsumerWidget {
  final BuildContext context;
  final TextEditingController textController;
  final Function(PreferencesParam) onConfirmation;
  final StateProvider languageProvider;
  final StateProvider ebookProvider;

  const FilterDialog(
      {super.key,
      required this.context,
      required this.textController,
      required this.onConfirmation,
      required this.languageProvider,
      required this.ebookProvider});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                              color: Colors.black.withOpacity(0.5),
                              offset: const Offset(0, 10),
                              blurRadius: 50),
                        ],
                        borderRadius:
                            const BorderRadius.all(Radius.circular(8))),
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
                          controller: textController,
                          decoration: InputDecoration(
                              hintText: "Insira uma palavra-chave",
                              hintStyle: TextStyle(
                                  fontSize: defaultTextSize,
                                  color: theme.appColors.textColor
                                      .withOpacity(0.3)),
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none),
                        ),
                        CustomButton(
                            isEnabled: true,
                            title: "Salvar",
                            onPressed: () {
                              Navigator.pop(context);
                              onConfirmation(PreferencesParam(
                                  isEbook:
                                      ref.read(ebookProvider.notifier).state,
                                  isPortuguese:
                                      ref.read(languageProvider.notifier).state,
                                  keyword: textController.text));
                            })
                      ],
                    )))
          ]));
        }));
  }
}
