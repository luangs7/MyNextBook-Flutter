import 'package:mynextbook/modules/data/remote/model/book_response.dart';
import 'package:mynextbook/modules/data/repository/model/book_data.dart';

class BookRemoteMapper {
  List<BookData> toRepo(BookResponse model) {
    return model.items
        .map((e) => BookData(
            id: e.id,
            title: e.volumeInfo.title,
            subtitle: e.volumeInfo.subtitle,
            description: e.volumeInfo.description,
            previewLink: e.volumeInfo.previewLink,
            infoLink: e.volumeInfo.infoLink,
            imageLinks: toImageRepo(e.volumeInfo.imageLinks),
            isFavorited: false))
        .toList();
  }

  BookImageData? toImageRepo(ImageLinks? model) {
    if (model != null) {
      return BookImageData(
          smallThumbnail: model.smallThumbnail, thumbnail: model.thumbnail);
    } else {
      return null;
    }
  }
}
