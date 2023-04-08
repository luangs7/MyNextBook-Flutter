import 'dart:async';

import 'package:mynextbook/common/base/api_result.dart';
import 'package:mynextbook/modules/cloudservices/auth/cloudservices_auth.dart';
import 'package:mynextbook/modules/data/repository/datasource/user_datasource_datastore.dart';
import 'package:mynextbook/modules/data/repository/mapper/user_repo_mapper.dart';
import 'package:mynextbook/modules/domain/model/login_param.dart';
import 'package:mynextbook/modules/domain/model/user.dart';
import 'package:mynextbook/modules/domain/repositories/user_repository.dart';

class UserDataRepositoryImpl implements UserDataRepository {
  final UserDataSourceDatastore userDataRepositoryImpl;
  final CloudServicesAuth cloudServicesAuth;
  final UserRepoMapper mapper;

  UserDataRepositoryImpl(
      {required this.userDataRepositoryImpl,
      required this.cloudServicesAuth,
      required this.mapper});

  @override
  Future<ApiResult<bool>> doLogin(LoginParam params) async {
    try {
      final isRegistered =
          await cloudServicesAuth.isUserRegistered(params.email);
      if (isRegistered) {
        final success =
            await cloudServicesAuth.signIn(params.email, params.password);
        return ApiResult.success(success);
      } else {
        final success =
            await cloudServicesAuth.signUp(params.email, params.password);
        return ApiResult.success(success);
      }
    } on Exception catch (e) {
      return ApiResult.error(e);
    }
  }

  @override
  Future<ApiResult<User>> getCurrentUser() async {
    try {
      final user = await cloudServicesAuth.currentUser();
      if (user != null) {
        return ApiResult.success(mapper.toDomain(user));
      } else {
        return ApiResult.empty();
      }
    } on Exception catch (error) {
      return ApiResult.error(error);
    }
  }

  @override
  Future<void> updatePreferences(String email) async {
    return userDataRepositoryImpl.updateEmail(email);
  }

  @override
  Future<String> loadPreferences() async {
    return userDataRepositoryImpl.loadPreferences();
  }

  @override
  Future<ApiResult<bool>> doLoginWithToken(String token) async {
    try {
      final result = await cloudServicesAuth.signInWithProvider(token);
      return ApiResult.success(result);
    } on Exception catch (error) {
      return ApiResult.error(error);
    }
  }
}
