import 'package:mynextbook/modules/data/local/model/book_entity.dart';
import 'package:mynextbook/modules/data/repository/model/book_data.dart';

class BookEntityMapper {
  BookEntity toEntity(BookData model, String userId) {
    return BookEntity(
        uuid: model.id,
        description: model.description ?? '',
        image: model.imageLinks?.thumbnail,
        previewLink: model.previewLink ?? "",
        subtitle: model.subtitle ?? "",
        title: model.title ?? "",
        userId: userId);
  }

  BookData toRepo(BookEntity model) {
    return BookData(
        description: model.description,
        imageLinks: toBookImageRepo(model.image),
        previewLink: model.previewLink,
        subtitle: model.subtitle,
        title: model.title,
        id: model.uuid,
        infoLink: null,
        isFavorited: false);
  }

  BookImageData toBookImageRepo(String? image) {
    return BookImageData(smallThumbnail: image ?? "", thumbnail: image ?? "");
  }
}
