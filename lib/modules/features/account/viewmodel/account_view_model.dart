import 'package:get_it/get_it.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mynextbook/common/base/base_view_model.dart';
import 'package:mynextbook/common/base/view_state.dart';
import 'package:mynextbook/modules/domain/interactor/get_current_user.dart';

import '../../../domain/interactor/do_change_password.dart';
import '../../../domain/interactor/do_delete_account.dart';

final accountViewModelProvider =
    ChangeNotifierProvider((ref) => GetIt.I.get<AccountViewModel>());

class AccountViewModel extends BaseViewModel {
  final DoChangePassword changePassword;
  final DoDeleteAccount deleteAccount;
  final GetCurrentUser getCurrentUser;

  AccountViewModel({required this.changePassword, required this.deleteAccount, required this.getCurrentUser});

  Future doChangePassword() async {
    return await changePassword.execute().then((value) {
      return ViewState.success(true);
    });
  }

  Future doDeleteAccount() async {
    return await deleteAccount.execute().then((value) {
      return ViewState.success(true);
    });
  }

  Future<bool> getIsLogged() async {
    final isLogged = await getCurrentUser.execute();
    return  isLogged != null;
  }
 }
