import 'package:mynextbook/common/base/api_result.dart';
import 'package:mynextbook/modules/domain/model/user.dart';
import 'package:mynextbook/modules/domain/repositories/user_repository.dart';

abstract class GetCurrentUser {
  Future<User?> execute();
}

class GetCurrentUserImpl extends GetCurrentUser {
  final UserDataRepository repository;

  GetCurrentUserImpl({required this.repository});

  @override
  Future<User?> execute() async {
    return repository.getCurrentUser();
  }
}
