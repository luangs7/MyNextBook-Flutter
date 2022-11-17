class BookData {
  final String id;
  final String? title;
  final String? subtitle;
  final List<String>? authors;
  final String? publisher;
  final String? description;
  final int? pageCount;
  final List<String>? categories;
  final String? contentVersion;
  final String? language;
  final String? previewLink;
  final String? infoLink;
  final String? averageRating;
  final int? ratingsCount;
  final String? publishedDate;
  final BookImageData? imageLinks;
  bool isFavorited = false;

  BookData(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.authors,
      required this.publisher,
      required this.description,
      required this.pageCount,
      required this.categories,
      required this.contentVersion,
      required this.language,
      required this.previewLink,
      required this.infoLink,
      required this.averageRating,
      required this.ratingsCount,
      required this.publishedDate,
      required this.imageLinks,
      required this.isFavorited});
}

class BookImageData {
  final String smallThumbnail;
  final String thumbnail;

  BookImageData({required this.smallThumbnail, required this.thumbnail});
}
