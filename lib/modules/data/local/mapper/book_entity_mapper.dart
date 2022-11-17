import 'package:mynextbook/modules/data/local/model/book_entity.dart';
import 'package:mynextbook/modules/data/local/model/book_image_entity.dart';
import 'package:mynextbook/modules/data/repository/model/book_data.dart';

class BookEntityMapper {
  BookEntity toEntity(BookData model) {
    return BookEntity(
        id: model.id,
        authors: model.authors ?? List.empty(),
        categories: model.categories ?? List.empty(),
        description: model.description ?? '',
        imageLinks: toBookImageEntity(model.imageLinks),
        language: model.language ?? "",
        previewLink: model.previewLink ?? "",
        publisher: model.publisher ?? "",
        subtitle: model.subtitle ?? "",
        title: model.title ?? "");
  }

  BookImageEntity toBookImageEntity(BookImageData? model) {
    return BookImageEntity(smallThumbnail: model?.smallThumbnail ?? "", thumbnail: model?.thumbnail ?? "");
  }

  BookData toRepo(BookEntity model) {
    return BookData(
        authors: model.authors,
        categories: model.categories,
        description: model.description,
        imageLinks: toBookImageRepo(model.imageLinks),
        language: model.language,
        previewLink: model.previewLink,
        publisher: model.publisher,
        subtitle: model.subtitle,
        title: model.title,
        averageRating: null,
        contentVersion: null,
        id: model.id,
        infoLink: null,
        pageCount: null,
        publishedDate: null,
        ratingsCount: null,
        isFavorited: false);
  }

  BookImageData toBookImageRepo(BookImageEntity? model) {
    return BookImageData(smallThumbnail: model?.smallThumbnail ?? "", thumbnail: model?.thumbnail ?? "");
  }
}
