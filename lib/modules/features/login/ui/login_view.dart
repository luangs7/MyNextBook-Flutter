import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:flutter/material.dart';
import 'package:mynextbook/navigation/app_router.dart';

import '../../../../designsystem/components/base_view.dart';
import '../../../../designsystem/components/custombar/custom_appbar_provider.dart';
import '../viewmodel/login_viewmodel.dart';
import 'login_body.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppRouter appRouter = GetIt.I.get();
    final viewModel = ref.watch(loginViewModelProvider);
    final isLoading = useState(false);

    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();
    final customBar = ref.watch(customBarProvider);
    handleCustomBar(customBar);

    useEffect(() {
      viewModel.loginFormState.status.handleState(onEach: (state) {
        isLoading.value = state == ViewState.loading();
      }, success: (data) {
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => appRouter.popFirst(context, appRouter.welcomeView));
      });

      return () {
        viewModel.resetLoginState();
      };
    }, [viewModel.loginFormState]);

    useEffect(() {
      void updateEmail() {
        viewModel.onEmailChanged(emailTextController.text);
      }

      void updatePassword() {
        viewModel.onPasswordChanged(passwordTextController.text);
      }

      void handleData() async {
        isLoading.value = true;
        viewModel.getUser().then((value) {
          value.handleState(success: ((data) async {
            if (data != null) {
              WidgetsBinding.instance
                  .addPostFrameCallback((_) => appRouter.pop(context));
            } else {
              viewModel.getLoginEmail().then((value) {
                isLoading.value = false;
                emailTextController.text = value;
              });
            }
          }));
        });
      }

      handleData();
      emailTextController.addListener(updateEmail);
      passwordTextController.addListener(updatePassword);
      return () {};
    }, []);

    return BaseView(
        child: isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : LoginBody(
                emailTextController: emailTextController,
                passwordTextController: passwordTextController,
                emailError: viewModel.loginFormState.fieldErrors,
                passwordError: viewModel.loginFormState.fieldErrors,
                isButtonEnabled: viewModel.loginFormState.isButtonEnabled,
                onLoginPressed: () {
                  viewModel.login(
                    emailTextController.text,
                    passwordTextController.text,
                  );
                },
              ));
  }

  handleCustomBar(CustomBarState customBar) {
    customBar.changeState(
        showBackButton: true,
        showActions: false,
        resizeToAvoidBottomInset: true,
        isVisible: true);
  }
}
