import 'package:floor/floor.dart';
import 'package:mynextbook/modules/data/local/model/book_image_entity.dart';

@entity
class BookEntity {
  @primaryKey
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String? previewLink;
  final BookImageEntity? imageLinks;
  final String userId;

  BookEntity(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.previewLink,
      required this.imageLinks,
      required this.userId});
}
