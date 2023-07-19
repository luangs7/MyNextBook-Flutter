import 'package:floor/floor.dart';

@entity
class BookEntity {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String? previewLink;
  final String? image;
  final String userId;
  @primaryKey
  late final String uuid;

  BookEntity(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.previewLink,
      required this.image,
      required this.userId}) {
    uuid = id + userId;
  }
}
