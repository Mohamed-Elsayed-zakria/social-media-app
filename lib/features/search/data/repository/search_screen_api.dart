import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/constant/collections.dart';
import '../../presentation/controller/search_screen_controller.dart';
import 'search_screen_repo.dart';

class SearchScreenApi extends SearchScreenRepo {
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getDataFuture() {
    return ApiService.firestore
        .collection(Collections.userCollection)
        .where("username", isEqualTo: getSearchResult.value)
        .get();
  }
}
