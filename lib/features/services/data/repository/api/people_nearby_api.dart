import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/collections.dart';
import '../people_nearby_repo.dart';

class PeopleNearbyApi extends PeopleNearbyRepo {
  @override
  Future<QuerySnapshot<Map<String, dynamic>>> getUserDataToPeopleNearby() {
    return ApiService.firestore
        .collection(Collections.userCollection)
        .where('personUid', isNotEqualTo: ApiService.user.uid)
        .get();
  }
}
