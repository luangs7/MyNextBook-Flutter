import 'package:mynextbook/modules/domain/repositories/user_repository.dart';

abstract class SetEmailLogin {
  Future<void> execute(String value);
}

class SetEmailLoginImpl extends SetEmailLogin {
  final UserDataRepository repository;

  SetEmailLoginImpl({required this.repository});

  @override
  Future<void> execute(String value) {
    return repository.updatePreferences(value);
  }
}
