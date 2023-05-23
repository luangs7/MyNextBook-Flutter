import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:flutter/material.dart';
import 'package:mynextbook/designsystem/components/custom_appbar.dart';
import 'package:mynextbook/navigation/app_router.dart';

import '../viewmodel/login_viewmodel.dart';
import 'login_body.dart';

class LoginView extends HookConsumerWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final AppRouter appRouter = GetIt.I.get();
    final viewModel = ref.watch(loginViewModelProvider);
    final emailError = useState(false);
    final passwordError = useState(false);
    final isButtonEnabled = useState(true);
    final isUserLoading = useState(true);

    final emailTextController = useTextEditingController();
    final passwordTextController = useTextEditingController();

    useEffect(() {
      void updateButtonEnabled() {
        isButtonEnabled.value = emailTextController.text.isNotEmpty &&
            passwordTextController.text.isNotEmpty;
        emailError.value = false;
        passwordError.value = false;
      }

      void handleData() async {
        viewModel.getUser().then((value) {
          value.handleState(success: ((data) async {
            if (data != null) {
              WidgetsBinding.instance?.addPostFrameCallback((_) =>
                  appRouter.to(context, appRouter.welcomeView, replace: true));
            } else {
              final emailSaved = await viewModel.getLoginEmail();
              emailTextController.text = emailSaved;
              isUserLoading.value = false;
            }
          }));
        });
      }

      handleData();
      emailTextController.addListener(updateButtonEnabled);
      passwordTextController.addListener(updateButtonEnabled);

      return () {
        // Clean up resources
        isUserLoading.value = true;
        emailTextController.removeListener(updateButtonEnabled);
        passwordTextController.removeListener(updateButtonEnabled);
        emailTextController.dispose();
        passwordTextController.dispose();
      };
    }, []);

    useEffect(() {
      viewModel.state.handleState(error: (exception) {
        emailError.value = true;
        passwordError.value = true;
      }, success: (data) {
        WidgetsBinding.instance.addPostFrameCallback(
            (_) => appRouter.to(context, appRouter.welcomeView, replace: true));
      });

      return () {};
    }, [viewModel.state]);

    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar().buildAppBar(
        context,
        appRouter,
        showBackButton: false,
        showActions: false,
      ),
      body: isUserLoading.value
          ? const Center(child: CircularProgressIndicator())
          : LoginBody(
              emailTextController: emailTextController,
              passwordTextController: passwordTextController,
              emailError: emailError.value,
              passwordError: passwordError.value,
              isButtonEnabled: isButtonEnabled.value,
              onLoginPressed: () {
                viewModel.login(
                  emailTextController.text,
                  passwordTextController.text,
                );
              },
            ),
    );
  }
}
