class AppPreferencesRepo {
  final bool isEbook;
  final String? keyword;
  final bool isPortuguese;
  final String? subject;


  AppPreferencesRepo({
    required this.isEbook,
    required this.keyword,
    required this.isPortuguese,
    required this.subject
  });

  factory AppPreferencesRepo.fromJson(dynamic json){
    return AppPreferencesRepo(
      isEbook: json['isEbook'],
      keyword: json['keyword'],
      isPortuguese: json['isPortuguese'],
      subject: json['subject']
    );
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