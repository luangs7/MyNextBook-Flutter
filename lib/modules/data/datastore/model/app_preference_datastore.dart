import 'package:hive/hive.dart';
part 'app_preference_datastore.g.dart';

@HiveType(typeId: 0)
class AppPreferenceDatastore {
  @HiveField(0)
  final bool isEbook;
  @HiveField(1)
  final String? keyword;
  @HiveField(2)
  final bool isPortuguese;
  @HiveField(3)
  final String? subject;

  AppPreferenceDatastore(
      {required this.isEbook,
      required this.keyword,
      required this.isPortuguese,
      required this.subject});
}
