import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/common/app_constants.dart';
import 'package:mynextbook/designsystem/common/app_theme.dart';
import 'package:mynextbook/designsystem/components/custom_button.dart';
import 'package:mynextbook/designsystem/components/custom_checkbok.dart';
import 'package:mynextbook/modules/features/finder/find/filter_textfield.dart';
import 'package:mynextbook/modules/features/preferences/model/preferences_param.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../domain/model/app_preferences.dart';
import 'filter_radio_choice.dart';

final orderByState = StateProvider<String?>((_) => "");

class FilterDialog extends HookConsumerWidget {
  final BuildContext context;
  final Function(PreferencesParam) onConfirmation;
  final AppPreferences pref;
  final StateProvider ebookProvider;
  final StateProvider languageProvider;

  FilterDialog(
      {super.key,
      required this.pref,
      required this.context,
      required this.ebookProvider,
      required this.languageProvider,
      required this.onConfirmation});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final titleController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final authorController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final editorController =
        useTextEditingController.fromValue(TextEditingValue.empty);
    final keywordController =
        useTextEditingController.fromValue(TextEditingValue.empty);

    onInitValues(ref,
        authorController: authorController,
        editorController: editorController,
        keywordController: keywordController,
        subjectController: subjectController,
        titleController: titleController);
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
                    FilterTextfield(
                      hint: AppLocalizations.of(context).keyword_author,
                      controller: authorController,
                    ),
                    FilterTextfield(
                      hint: AppLocalizations.of(context).keyword_title,
                      controller: titleController,
                    ),
                    FilterTextfield(
                      hint: AppLocalizations.of(context).keyword_category,
                      controller: subjectController,
                    ),
                    FilterTextfield(
                      hint: AppLocalizations.of(context).keyword_editor,
                      controller: editorController,
                    ),
                    FilterTextfield(
                      hint: AppLocalizations.of(context).keyword_all,
                      controller: keywordController,
                    ),
                    FilterRadio(currentValue: pref.orderBy),
                    const SizedBox(
                      height: defaultPaddingBig,
                    ),
                    CustomButton(
                        isEnabled: true,
                        title: AppLocalizations.of(context).confirm,
                        onPressed: () {
                          Navigator.pop(context);
                          onConfirmation(setPrefParams(ref,
                              orderBy: ref.watch(orderByState.notifier).state,
                              authorController: authorController,
                              editorController: editorController,
                              keywordController: keywordController,
                              subjectController: subjectController,
                              titleController: titleController));
                        })
                  ],
                ))
          ]);
        }));
  }

  void onInitValues(WidgetRef ref,
      {required TextEditingController subjectController,
      required TextEditingController titleController,
      required TextEditingController keywordController,
      required TextEditingController authorController,
      required TextEditingController editorController}) {
    subjectController.text = pref.subject ?? "";
    titleController.text = pref.title ?? "";
    authorController.text = pref.author ?? "";
    keywordController.text = pref.keyword ?? "";
    editorController.text = pref.editor ?? "";
  }

  PreferencesParam setPrefParams(WidgetRef ref,
      {required String? orderBy,
      required TextEditingController subjectController,
      required TextEditingController titleController,
      required TextEditingController authorController,
      required TextEditingController keywordController,
      required TextEditingController editorController}) {
    return PreferencesParam(
        isEbook: ref.read(ebookProvider.notifier).state,
        isPortuguese: ref.read(languageProvider.notifier).state,
        author: authorController.text,
        editor: editorController.text,
        keyword: keywordController.text,
        subject: subjectController.text,
        orderBy: orderBy,
        title: titleController.text);
  }
}
