import 'package:mynextbook/common/base/api_result.dart';
import 'package:mynextbook/modules/domain/model/app_preferences.dart';
import 'package:mynextbook/modules/domain/model/book.dart';
import 'package:mynextbook/modules/domain/repositories/book_remote_repository.dart';

abstract class GetRecommendations {
  Future<ApiResult<List<Book>>> execute(AppPreferences? params);
}

class GetRecommendationsImpl extends GetRecommendations {
  final BookRemoteRepository repository;

  GetRecommendationsImpl({required this.repository});

  @override
  Future<ApiResult<List<Book>>> execute(AppPreferences? params) {
    return repository.getRecommendations(params);
  }
}
