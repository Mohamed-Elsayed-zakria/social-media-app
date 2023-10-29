import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/constant/collections.dart';
import '../../presentation/controller/search_screen_controller.dart';
import '../model/search_model.dart';
import 'search_screen_repo.dart';

class SearchScreenApi extends SearchScreenRepo {
  @override
  Future<List<SearchModel>> getDataFuture() async {
    List<SearchModel> allUser = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
        .firestore
        .collection(Collections.userCollection)
        .where("username", isEqualTo: getSearchResult.value)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        SearchModel searchModel = SearchModel.fromJson(doc.data());
        allUser.add(searchModel);
      }
    }
    return allUser;
  }
}
