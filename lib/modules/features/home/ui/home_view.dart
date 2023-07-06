import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/designsystem/components/information_view.dart';
import 'package:mynextbook/navigation/app_router.dart';

import '../../../../designsystem/common/lottie_states.dart';
import '../../../../designsystem/components/base_view.dart';
import '../../../../designsystem/components/custombar/custom_appbar_provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeView extends HookConsumerWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppRouter appRouter = GetIt.I.get();
    final customBar = ref.read(customBarProvider);
    customBar.changeState(showBackButton: false, showActions: true);

    return BaseView(
        child: InformationView(
            title: AppLocalizations.of(context).welcome_title,
            buttonTitle: AppLocalizations.of(context).btn_go,
            lottieAnimation: lottieBookIdea,
            subtitle: AppLocalizations.of(context).welcome_subtitle,
            onInformation: null,
            onNext: () {
              appRouter.to(context, appRouter.finderView);
            }));
  }
}
