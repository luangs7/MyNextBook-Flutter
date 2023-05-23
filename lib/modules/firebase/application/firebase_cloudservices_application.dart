import 'package:mynextbook/modules/cloudservices/application/cloudservices_application.dart';
import 'package:firebase_core/firebase_core.dart';

class FirebaseCloudServicesApplication extends CloudServicesApplication {
  @override
  void initialize() async {
    await Firebase.initializeApp();
  }
}
