import 'package:mynextbook/modules/data/repository/model/book_data.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:mynextbook/modules/domain/model/book_image.dart';

class BookRepoMapper {
  BookData toRepo(Book model) {
    return BookData(
        id: model.id,
        title: model.title,
        subtitle: model.subtitle,
        description: model.description,
        imageLinks: toImageRepo(model.imageLinks),
        previewLink: model.previewLink,
        infoLink: model.infoLink,
        isFavorited: model.isFavorited);
  }

  Book toDomain(BookData model) {
    return Book(
        id: model.id,
        title: model.title,
        subtitle: model.subtitle,
        description: model.description,
        imageLinks: toImageDomain(model.imageLinks),
        previewLink: model.previewLink,
        isFavorited: model.isFavorited,
        infoLink: model.infoLink);
  }

  BookImageData? toImageRepo(BookImage? model) {
    return model != null
        ? BookImageData(
            smallThumbnail: model.smallThumbnail, thumbnail: model.thumbnail)
        : null;
  }

  BookImage? toImageDomain(BookImageData? model) {
    return model != null
        ? BookImage(
            smallThumbnail: model.smallThumbnail, thumbnail: model.thumbnail)
        : null;
  }
}
