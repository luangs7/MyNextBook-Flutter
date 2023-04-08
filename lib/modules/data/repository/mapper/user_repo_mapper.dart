import 'package:mynextbook/modules/cloudservices/auth/current_user.dart';
import 'package:mynextbook/modules/domain/model/user.dart';

class UserRepoMapper {
  User toDomain(CurrentUser model) {
    return User(model.uuid, model.name, model.email, model.avatar);
  }
}
