class BookData {
  final String id;
  final String? title;
  final String? subtitle;
  final String? description;
  final String? previewLink;
  final String? infoLink;
  final BookImageData? imageLinks;
  bool isFavorited = false;

  BookData(
      {required this.id,
      required this.title,
      required this.subtitle,
      required this.description,
      required this.previewLink,
      required this.infoLink,
      required this.imageLinks,
      required this.isFavorited});
}

class BookImageData {
  final String smallThumbnail;
  final String thumbnail;

  BookImageData({required this.smallThumbnail, required this.thumbnail});
}
