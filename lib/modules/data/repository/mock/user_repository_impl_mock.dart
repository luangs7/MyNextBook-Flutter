import 'package:mynextbook/modules/domain/model/user.dart';

import 'package:mynextbook/modules/domain/model/login_param.dart';

import 'package:mynextbook/common/base/api_result.dart';

import '../../../domain/repositories/user_repository.dart';

class UserDataRepositoryImplMock extends UserDataRepository {
  @override
  Future<ApiResult<bool>> doLogin(LoginParam loginParam) async {
    return Future.value(ApiResult.success(true));
  }

  @override
  Future<ApiResult<bool>> doLoginWithToken(String token) async {
    return Future.value(ApiResult.success(true));
  }

  @override
  Future<User?> getCurrentUser() async {
    return Future.value(User("1234565", "Teste", "teste@teste.com", null));
  }

  @override
  Future<String> loadPreferences() async {
    return Future.value("abc");
  }

  @override
  Future<void> updatePreferences(String email) async {
    return Future.value();
  }

  @override
  Future doLogout() {
    return Future.value();
  }
}
