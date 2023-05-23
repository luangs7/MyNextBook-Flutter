import 'package:mynextbook/common/base/api_result.dart';
import 'package:mynextbook/modules/domain/model/login_param.dart';
import 'package:mynextbook/modules/domain/repositories/user_repository.dart';

abstract class DoLogin {
  Future<ApiResult<bool>> execute(
      String? email, String? password, String? token);
}

class DoLoginImpl extends DoLogin {
  final UserDataRepository repository;

  DoLoginImpl({required this.repository});

  @override
  Future<ApiResult<bool>> execute(
      String? email, String? password, String? token) {
    if (token != null) {
      return repository.doLoginWithToken(token);
    } else if (email != null && password != null) {
      return repository.doLogin(LoginParam(email, password));
    } else {
      return Future.value(ApiResult.error(Exception()));
    }
  }
}
