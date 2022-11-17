import 'package:floor/floor.dart';
import 'package:mynextbook/modules/data/local/model/book_image_entity.dart';

@entity
class BookEntity {
  @primaryKey
  final String id;
  final String title;
  final String subtitle;
  final List<String>? authors;
  final String publisher;
  final String description;
  final List<String>? categories;
  final String language;
  final String? previewLink;
  final BookImageEntity? imageLinks;

  BookEntity(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.authors,
      required this.publisher,
      required this.description,
      required this.categories,
      required this.language,
      required this.previewLink,
      required this.imageLinks});
}
