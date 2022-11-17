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
  Future<BookData> getBooksFromQuery(AppPreferencesRepo appPreferencesRepo) async {
    var filter = appPreferencesRepo.isEbook ? ebookQuery : null;
    var query = createQueryParams(appPreferencesRepo);
    await service
        .getBooks(
            query, appPreferencesRepo.isPortuguese ? languagePt : null, filter, orderByQueryValue, maxresultsValue)
        .then((value) {
      var list = mapper.toRepo(value);
      return (list..shuffle()).first;
    }).catchError((onError) {
      throw onError;
    });

    throw Exception();
  }

  String createQueryParams(AppPreferencesRepo appPreferencesRepo) {
    var query = StringBuffer();
    var keyword = appPreferencesRepo.keyword?.replaceAll(dividerOld, divider) ?? "";
    if (keyword.isNotEmpty) {
      query.write(keyword);
    }
    return query.toString();
  }
}
