class AppPreferences {
  final bool isEbook;
  final String? keyword;
  final bool isPortuguese;
  final String? subject;
  final String? title;
  final String? author;
  final String? editor;
  final String? orderBy;

  AppPreferences(
      {required this.isEbook,
      required this.keyword,
      required this.isPortuguese,
      required this.subject,
      required this.title,
      required this.author,
      required this.orderBy,
      required this.editor});
}
