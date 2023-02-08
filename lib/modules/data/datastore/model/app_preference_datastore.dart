class AppPreferenceDatastore {
  final bool isEbook;
  final String? keyword;
  final bool isPortuguese;
  final String? subject;

  AppPreferenceDatastore(
      {required this.isEbook,
      required this.keyword,
      required this.isPortuguese,
      required this.subject});

  factory AppPreferenceDatastore.fromJson(dynamic json) {
    return AppPreferenceDatastore(
        isEbook: json['isEbook'],
        keyword: json['keyword'],
        isPortuguese: json['isPortuguese'],
        subject: json['subject']);
  }

  Map<String, dynamic> toJson() {
    return {
      'isEbook': isEbook,
      'keyword': keyword,
      'isPortuguese': isPortuguese,
      'subject': subject
    };
  }
}
