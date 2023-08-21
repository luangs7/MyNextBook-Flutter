import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/designsystem/common/app_theme.dart';
import 'package:mynextbook/designsystem/common/app_theme_text.dart';
import 'package:mynextbook/designsystem/common/lottie_states.dart';
import 'package:mynextbook/designsystem/components/base_view.dart';
import 'package:mynextbook/designsystem/components/custombar/custom_appbar_provider.dart';
import 'package:mynextbook/designsystem/components/grid_items.dart';
import 'package:mynextbook/designsystem/components/lottie_view.dart';
import 'package:mynextbook/modules/features/recommendation/ui/recommendation_item.dart';
import 'package:mynextbook/modules/features/recommendation/viewmodel/recommendation_view_model.dart';
import 'package:mynextbook/navigation/app_router.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../designsystem/common/app_colors.dart';

class RecommendationView extends HookConsumerWidget {
  const RecommendationView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppRouter appRouter = GetIt.I.get();
    final customBar = ref.read(customBarProvider);
    final viewModel = ref.watch(recommendationViewModelProvider);
    customBar.changeState(
        showBackButton: false,
        showActions: true,
        title: AppLocalizations.of(context).find_my);
    final theme = ref.watch(appThemeProvider);

    useEffect(() {
      viewModel.getBook();
      return () {};
    }, []);

    return BaseView(
        child: Scaffold(
      body: viewModel.bookState.handleWidget(
          success: (data) {
            return Stack(children: [
              GridItems(
                  data: data,
                  builder: (context, index) {
                    return RecommendationItem(
                        book: data[index], onDetails: (data) {});
                  })
            ]);
          },
          error: (exception) {
            return LottieView(
                asset: lottieError,
                message: AppLocalizations.of(context).error_message);
          },
          loading: () => const LottieView(asset: lottieLoading),
          empty: () => LottieView(
                asset: lottieEmpty,
                message: AppLocalizations.of(context).empty_favorites,
              )),
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: AppColors.dark().accent.withOpacity(0.7),
          onPressed: () {
            viewModel.isLoggedIn().then((logged) {
              if (logged) {
                appRouter.to(context, appRouter.welcomeView);
              } else {
                appRouter.to(context, appRouter.loginView);
              }
            });
          },
          label: Text(AppLocalizations.of(context).find_my,
              style: AppTextTheme()
                  .h30
                  .light()
                  .copyWith(color: theme.appColors.textColor)),
          icon: Icon(
            Icons.search,
            color: theme.appColors.textColor,
          )),
    ));
  }
}
