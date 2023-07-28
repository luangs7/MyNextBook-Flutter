import '../../../common/base/api_result.dart';
import '../repositories/user_repository.dart';

abstract class DoDeleteAccount {
  Future<ApiResult<void>> execute();
}

class DoDeleteAccountImpl extends DoDeleteAccount {
  final UserDataRepository repository;

  DoDeleteAccountImpl({required this.repository});

  @override
  Future<ApiResult<void>> execute() async {
    return await repository.deleteAccount();
  }
}
