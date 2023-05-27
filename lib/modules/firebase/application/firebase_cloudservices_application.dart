import 'package:mynextbook/modules/cloudservices/application/cloudservices_application.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mynextbook/firebase_options.dart';

class FirebaseCloudServicesApplication extends CloudServicesApplication {
  @override
  Future initialize() async {
    return Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }
}
