class PreferencesParam {
  final bool isEbook;
  final String? keyword;
  final bool isPortuguese;
  final String? subject;
  final String? title;
  final String? author;
  final String? editor;
  final String? orderBy;

  PreferencesParam(
      {required this.isEbook,
      required this.isPortuguese,
      required this.subject,
      required this.keyword,
      required this.title,
      required this.orderBy,
      required this.author,
      required this.editor});
}
