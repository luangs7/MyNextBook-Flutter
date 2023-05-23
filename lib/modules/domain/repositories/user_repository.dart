import 'package:mynextbook/common/base/api_result.dart';
import 'package:mynextbook/modules/domain/model/login_param.dart';
import 'package:mynextbook/modules/domain/model/user.dart';

abstract class UserDataRepository {
  Future<ApiResult<bool>> doLogin(LoginParam loginParam);
  Future<ApiResult<bool>> doLoginWithToken(String token);

  Future<User?> getCurrentUser();
  Future<void> updatePreferences(String email);
  Future<String> loadPreferences();
}
