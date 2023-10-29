import '../model/search_model.dart';

abstract class SearchScreenRepo {
   Future<List<SearchModel>> getDataFuture();
}
