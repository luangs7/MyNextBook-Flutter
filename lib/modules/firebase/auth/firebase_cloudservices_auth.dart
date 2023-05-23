import 'package:mynextbook/modules/cloudservices/auth/cloudservices_auth.dart';
import 'package:mynextbook/modules/cloudservices/auth/current_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseCloudServicesAuth extends CloudServicesAuth {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  Future<CurrentUser?> currentUser() async {
    final user = firebaseAuth.currentUser;
    if (user != null) {
      return Future.value(CurrentUser(
          uuid: user.uid,
          name: user.displayName ?? "",
          email: user.email ?? "",
          avatar: user.photoURL));
    } else {
      return Future.value(null);
    }
  }

  @override
  Future<bool> isUserRegistered(String email) async {
    final methods = await firebaseAuth.fetchSignInMethodsForEmail(email);
    return methods.isNotEmpty;
  }

  @override
  Future<bool> signIn(String email, String password) async {
    final result = await firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
    return result.user != null;
  }

  @override
  Future<bool> signInWithProvider(String token) async {
    final result = await firebaseAuth
        .signInWithCredential(GoogleAuthProvider.credential(idToken: token));
    return result.user != null;
  }

  @override
  Future signOut() async {
    return await firebaseAuth.signOut();
  }

  @override
  Future<bool> signUp(String email, String password) async {
    final result = await firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
    return result.user != null;
  }
}
