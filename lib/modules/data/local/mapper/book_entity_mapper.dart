import 'package:mynextbook/modules/data/local/model/book_entity.dart';
import 'package:mynextbook/modules/data/local/model/book_image_entity.dart';
import 'package:mynextbook/modules/data/repository/model/book_data.dart';

class BookEntityMapper {
  BookEntity toEntity(BookData model, String userId) {
    return BookEntity(
        id: model.id,
        description: model.description ?? '',
        imageLinks: toBookImageEntity(model.imageLinks),
        previewLink: model.previewLink ?? "",
        subtitle: model.subtitle ?? "",
        title: model.title ?? "",
        userId: userId);
  }

  BookImageEntity toBookImageEntity(BookImageData? model) {
    return BookImageEntity(
        smallThumbnail: model?.smallThumbnail ?? "",
        thumbnail: model?.thumbnail ?? "");
  }

  BookData toRepo(BookEntity model) {
    return BookData(
        description: model.description,
        imageLinks: toBookImageRepo(model.imageLinks),
        previewLink: model.previewLink,
        subtitle: model.subtitle,
        title: model.title,
        id: model.id,
        infoLink: null,
        isFavorited: false);
  }

  BookImageData toBookImageRepo(BookImageEntity? model) {
    return BookImageData(
        smallThumbnail: model?.smallThumbnail ?? "",
        thumbnail: model?.thumbnail ?? "");
  }
}
