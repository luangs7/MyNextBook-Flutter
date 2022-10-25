import 'package:mynextbook/modules/data/repository/model/book_data.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:mynextbook/modules/domain/model/book_image.dart';

class BookRepoMapper {
  BookData toRepo(Book model){
    return BookData(
      id: model.id,
      title: model.title,
      subtitle: model.subtitle,
      authors: model.authors,
      publisher: model.publisher,
      description: model.description,
      pageCount: model.pageCount,
      categories: model.categories,
      contentVersion: model.contentVersion,
      imageLinks: toImageRepo(model.imageLinks),
      language: model.language,
      previewLink: model.previewLink,
      infoLink: model.infoLink,
      averageRating: model.averageRating,
      ratingsCount: model.ratingsCount,
      publishedDate: model.publishedDate,
      isFavorited: model.isFavorited
    );
  }

  Book toDomain(BookData model){
    return Book(
        id: model.id,
      title: model.title,
      subtitle: model.subtitle,
      authors: model.authors,
      publisher: model.publisher,
      description: model.description,
      pageCount: model.pageCount,
      categories: model.categories,
      contentVersion: model.contentVersion,
      imageLinks: toImageDomain(model.imageLinks),
      language: model.language,
      previewLink: model.previewLink,
      infoLink: model.infoLink,
      averageRating: model.averageRating,
      ratingsCount: model.ratingsCount,
      publishedDate: model.publishedDate
    );
  }


  BookImageData? toImageRepo(BookImage? model){
    return model != null ? BookImageData(smallThumbnail: model.smallThumbnail, thumbnail: model.thumbnail) : null;
  }

  BookImage? toImageDomain(BookImageData? model){
    return model != null ? BookImage(smallThumbnail: model.smallThumbnail, thumbnail: model.thumbnail) : null;
  }
}