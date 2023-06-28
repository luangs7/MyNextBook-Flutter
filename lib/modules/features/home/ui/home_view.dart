import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/components/information_view.dart';
import 'package:mynextbook/navigation/app_router.dart';

import '../../../../designsystem/components/base_view.dart';
import '../../../../designsystem/components/custombar/custom_appbar_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppRouter appRouter = GetIt.I.get();
    final customBar = ref.read(customBarProvider);
    customBar.showBackButton = false;
    customBar.showActions = true;

    return BaseView(
        child: InformationView(
            title: "Está com dúvida de qual vai ser seu próximo livro?",
            buttonTitle: "Vamos lá!",
            lottieAnimation: "book_ideia",
            subtitle: "Deixa que vamos te ajudar!",
            onInformation: null,
            onNext: () {
              appRouter.to(context, appRouter.finderView);
            }));
  }
}
