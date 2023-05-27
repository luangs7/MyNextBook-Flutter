import 'package:mynextbook/modules/domain/repositories/user_repository.dart';

abstract class DoLogout {
  Future execute();
}

class DoLogoutImpl extends DoLogout {
  final UserDataRepository repository;

  DoLogoutImpl({required this.repository});

  @override
  Future execute() {
    return repository.doLogout();
  }
}
