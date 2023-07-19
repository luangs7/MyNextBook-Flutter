import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:mynextbook/designsystem/common/app_theme.dart';
import 'package:mynextbook/designsystem/components/custom_button.dart';
import 'package:mynextbook/designsystem/components/custom_checkbok.dart';
import 'package:mynextbook/modules/features/preferences/model/preferences_param.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
    return Dialog(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        child: Consumer(builder: (context, ref, child) {
          var theme = ref.watch(appThemeProvider);
          return Wrap(children: [
            Container(
                padding: const EdgeInsets.all(defaultPadding),
                decoration: BoxDecoration(
                    color: theme.appColors.background,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(0, 10),
                          blurRadius: 50),
                    ],
                    borderRadius: const BorderRadius.all(Radius.circular(8))),
                child: Column(
                  children: [
                    CustomCheckbox(
                      label: AppLocalizations.of(context).ebook_only,
                      provider: ebookProvider,
                    ),
                    CustomCheckbox(
                      label: AppLocalizations.of(context).language_title,
                      provider: languageProvider,
                    ),
                    TextField(
                      controller: textController,
                      decoration: InputDecoration(
                          hintText:
                              AppLocalizations.of(context).keyword_description,
                          hintStyle: TextStyle(
                              fontSize: defaultTextSize,
                              color:
                                  theme.appColors.textColor.withOpacity(0.3)),
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none),
                    ),
                    CustomButton(
                        isEnabled: true,
                        title: AppLocalizations.of(context).confirm,
                        onPressed: () {
                          Navigator.pop(context);
                          onConfirmation(PreferencesParam(
                              isEbook: ref.read(ebookProvider.notifier).state,
                              isPortuguese:
                                  ref.read(languageProvider.notifier).state,
                              keyword: textController.text));
                        })
                  ],
                ))
          ]);
        }));
  }
}
