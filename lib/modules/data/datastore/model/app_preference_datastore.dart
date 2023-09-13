import 'package:hive/hive.dart';
part 'app_preference_datastore.g.dart';

@HiveType(typeId: 0)
class AppPreferenceDatastore {
  @HiveField(0)
  final bool isEbook;
  @HiveField(1)
  final bool isPortuguese;
  @HiveField(2)
  final String? subject;
  @HiveField(3)
  final String? title;
  @HiveField(4)
  final String? author;
  @HiveField(5)
  final String? editor;
  @HiveField(6)
  final String? keyword;
  @HiveField(7)
  final String? orderBy;

  AppPreferenceDatastore(
      {required this.isEbook,
      required this.isPortuguese,
      required this.subject,
      required this.title,
      required this.keyword,
      required this.orderBy,
      required this.author,
      required this.editor});

  static AppPreferenceDatastore init() {
    return AppPreferenceDatastore(
        author: null,
        keyword: null,
        orderBy: "relevance",
        editor: null,
        isEbook: false,
        isPortuguese: false,
        subject: null,
        title: null);
  }
}
