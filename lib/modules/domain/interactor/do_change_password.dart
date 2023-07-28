import '../../../common/base/api_result.dart';
import '../repositories/user_repository.dart';

abstract class DoChangePassword {
  Future<ApiResult<bool>> execute();
}

class DoChangePasswordImpl extends DoChangePassword {
  final UserDataRepository repository;

  DoChangePasswordImpl({required this.repository});

  @override
  Future<ApiResult<bool>> execute() async {
    return await repository.changePassword();
  }
}
