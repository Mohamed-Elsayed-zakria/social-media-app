import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/collections.dart';
import '../explore_frinds_repo.dart';

class ExploreFrindsApi extends ExploreFrindsRepo {
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getUserDataToExploreFrinds() {
    return ApiService.firestore
        .collection(Collections.userCollection)
        .where('personUid', isNotEqualTo: ApiService.user.uid)
        .get();
    
  }
}
