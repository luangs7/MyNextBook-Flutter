import 'package:mynextbook/modules/data/remote/mapper/book_remote_mapper.dart';
import 'package:mynextbook/modules/data/remote/service/book_service.dart';
import 'package:mynextbook/modules/data/remote/service/book_service_constants.dart';
import 'package:mynextbook/modules/data/repository/datasource/book_data_source_remote.dart';
import 'package:mynextbook/modules/data/repository/model/app_preferences_repo.dart';
import 'package:mynextbook/modules/data/repository/model/book_data.dart';

class BookDataSourceRemoteImpl extends BookDataSourceRemote {
  final BookService service;
  final BookRemoteMapper mapper;

  BookDataSourceRemoteImpl({required this.service, required this.mapper});

  @override
  Future<BookData?> getBooksFromQuery(AppPreferencesRepo pref) async {
    var filter = pref.isEbook ? ebookQuery : null;
    var query = createQueryParams(pref);
    return await service
        .getBooks(query, pref.isPortuguese ? languagePt : null, filter,
            pref.orderBy ?? orderByQueryValue, maxresultsValue)
        .then((value) {
      var list = mapper.toRepo(value);
      if (list.isNotEmpty) {
        return (list..shuffle()).first;
      } else {
        return null;
      }
    }).catchError((onError) {
      throw onError;
    });
  }

  String createQueryParams(AppPreferencesRepo model) {
    var query = StringBuffer();
    var keyword = model.keyword?.replaceAll(dividerOld, divider) ?? "";
    query.write(keyword);

    if (model.author != null && model.author?.isNotEmpty == true) {
      var author = model.author?.replaceAll(dividerOld, divider) ?? "";
      query.write("+$authorParam$author");
    }

    if (model.subject != null && model.subject?.isNotEmpty == true) {
      var author = model.subject?.replaceAll(dividerOld, divider) ?? "";
      query.write("+$subjectParam$author");
    }

    if (model.editor != null && model.editor?.isNotEmpty == true) {
      var author = model.editor?.replaceAll(dividerOld, divider) ?? "";
      query.write("+$editorParam$author");
    }

    if (model.title != null && model.title?.isNotEmpty == true) {
      var author = model.title?.replaceAll(dividerOld, divider) ?? "";
      query.write("+$titleParam$author");
    }

    return query.toString();
  }
}
