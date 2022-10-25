import 'package:floor/floor.dart';

@entity
class BookImageEntity {
  @primaryKey
  final String smallThumbnail;
  final String thumbnail;

  BookImageEntity({
    required this.smallThumbnail,
    required this.thumbnail
  });
}