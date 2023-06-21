import 'package:mynextbook/modules/domain/model/book_image.dart';

class Book {
  final String id;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? previewLink;
  final String? infoLink;
  final bool isFavorited = false;
  final BookImage? imageLinks;

  Book(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.previewLink,
      required this.infoLink,
      required this.imageLinks});
}
