import 'package:mynextbook/modules/data/remote/model/book_response.dart';
import 'package:mynextbook/modules/data/repository/model/book_data.dart';

class BookRemoteMapper {
  List<BookData> toRepo(BookResponse model) {
    return model.items
        .map((e) => BookData(
            id: e.id,
            title: e.volumeInfo.title,
            subtitle: e.volumeInfo.subtitle,
            authors: e.volumeInfo.authors,
            publisher: e.volumeInfo.publisher,
            description: e.volumeInfo.description,
            pageCount: e.volumeInfo.pageCount,
            categories: e.volumeInfo.categories,
            contentVersion: e.volumeInfo.contentVersion,
            language: e.volumeInfo.language,
            previewLink: e.volumeInfo.previewLink,
            infoLink: e.volumeInfo.infoLink,
            averageRating: e.volumeInfo.averageRating,
            ratingsCount: e.volumeInfo.ratingsCount,
            publishedDate: e.volumeInfo.publishedDate,
            imageLinks: toImageRepo(e.volumeInfo.imageLinks),
            isFavorited: false))
        .toList();
  }

  BookImageData? toImageRepo(ImageLinks? model) {
    if (model != null) {
      return BookImageData(smallThumbnail: model.smallThumbnail, thumbnail: model.thumbnail);
    } else {
      return null;
    }
  }
}
