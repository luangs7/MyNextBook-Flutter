import 'package:mynextbook/modules/domain/repositories/user_repository.dart';

abstract class GetEmailLogin {
  Future<String> execute();
}

class GetEmailLoginImpl extends GetEmailLogin {
  final UserDataRepository repository;

  GetEmailLoginImpl({required this.repository});

  @override
  Future<String> execute() {
    return repository.loadPreferences();
  }
}
