class AppPreferencesRepo {
  final bool isEbook;
  final String? keyword;
  final bool isPortuguese;
  final String? subject;

  AppPreferencesRepo(
      {required this.isEbook,
      required this.keyword,
      required this.isPortuguese,
      required this.subject});
}
