import 'package:objectbox/objectbox.dart';

@Entity()
class BookEntity {
  @Id(assignable: true)
  int id = 0;
  final String uuid;
  final String title;
  final String subtitle;
  final String description;
  final String? previewLink;
  final String? image;
  final String userId;

  BookEntity(
      {required this.uuid,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.previewLink,
      required this.image,
      required this.userId});
}
