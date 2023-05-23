import 'package:get_it/get_it.dart';
import 'package:mynextbook/modules/cloudservices/analytics/cloudservices_analytics.dart';
import 'package:mynextbook/modules/cloudservices/application/cloudservices_application.dart';
import 'package:mynextbook/modules/cloudservices/auth/cloudservices_auth.dart';
import 'package:mynextbook/modules/cloudservices/remoteconfig/cloudservices_remoteconfig.dart';
import 'package:mynextbook/modules/firebase/analytics/firebase_cloudservices_analytics.dart';
import 'package:mynextbook/modules/firebase/application/firebase_cloudservices_application.dart';
import 'package:mynextbook/modules/firebase/auth/firebase_cloudservices_auth.dart';
import 'package:mynextbook/modules/firebase/remoteconfig/firebase_cloudservices_remoteconfig.dart';

extension FirebaseModule on GetIt {
  void firebaseModule() {
    registerLazySingleton<CloudServicesAuth>(() => FirebaseCloudServicesAuth());
    registerLazySingleton<CloudServicesAnalytics>(
        () => FirebaseCloudServicesAnalytics());
    registerLazySingleton<CloudServicesApplication>(
        () => FirebaseCloudServicesApplication());
    registerLazySingleton<CloudServicesRemoteConfig>(
        () => FirebaseCloudServicesRemoteConfig());
  }
}
