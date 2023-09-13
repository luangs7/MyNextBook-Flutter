import 'package:mynextbook/modules/cloudservices/auth/current_user.dart';

abstract class CloudServicesAuth {
  Future<bool> signIn(String email, String password);
  Future<bool> signUp(String email, String password);
  Future<bool> isUserRegistered(String email);
  Future<CurrentUser?> currentUser();
  Future signOut();
  Future<bool> signInWithProvider(String token);
  Future requestPasswordChange(String email);
  Future deleteAccount();
}
