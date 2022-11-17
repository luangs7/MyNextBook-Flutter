import 'package:json_annotation/json_annotation.dart';
part 'book_response.g.dart';

@JsonSerializable(explicitToJson: true)
class BookResponse {
  final int totalItems;
  final List<Item> items;

  BookResponse({required this.totalItems, required this.items});

  factory BookResponse.fromJson(Map<String, dynamic> json) => _$BookResponseFromJson(json);
  Map<String, dynamic> toJson() => _$BookResponseToJson(this);
}

@JsonSerializable()
class Item {
  final String id;
  final VolumeInfo volumeInfo;

  Item({required this.id, required this.volumeInfo});

  factory Item.fromJson(Map<String, dynamic> json) => _$ItemFromJson(json);
  Map<String, dynamic> toJson() => _$ItemToJson(this);
}

@JsonSerializable()
class VolumeInfo {
  final String title;
  final String? subtitle;
  final List<String>? authors;
  final String? publisher;
  final String? description;
  final int? pageCount;
  final List<String>? categories;
  final bool allowAnonLogging;
  final String? contentVersion;
  final ImageLinks? imageLinks;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? canonicalVolumeLink;
  final String? averageRating;
  final int? ratingsCount;
  final String? publishedDate;

  VolumeInfo(
      {required this.title,
      required this.subtitle,
      required this.authors,
      required this.publisher,
      required this.description,
      required this.pageCount,
      required this.categories,
      required this.allowAnonLogging,
      required this.contentVersion,
      required this.imageLinks,
      required this.language,
      required this.previewLink,
      required this.infoLink,
      required this.canonicalVolumeLink,
      required this.averageRating,
      required this.ratingsCount,
      required this.publishedDate});

  factory VolumeInfo.fromJson(Map<String, dynamic> json) => _$VolumeInfoFromJson(json);
  Map<String, dynamic> toJson() => _$VolumeInfoToJson(this);
}

@JsonSerializable()
class ImageLinks {
  final String smallThumbnail;
  final String thumbnail;

  ImageLinks({required this.smallThumbnail, required this.thumbnail});

  factory ImageLinks.fromJson(Map<String, dynamic> json) => _$ImageLinksFromJson(json);
  Map<String, dynamic> toJson() => _$ImageLinksToJson(this);
}
