import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/collections.dart';
import '../../model/people_nearby_model.dart';
import '../people_nearby_repo.dart';

class PeopleNearbyApi extends PeopleNearbyRepo {
  @override
  Future<List<PeopleNearbyModel>> getUserDataToPeopleNearby() async {
    List<PeopleNearbyModel> userData = [];

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
        .firestore
        .collection(Collections.userCollection)
        .where('personUid', isNotEqualTo: ApiService.user.uid)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        Map<String, dynamic> jsonData = doc.data();
        userData.add(PeopleNearbyModel.fromJson(jsonData));
      }
    }

    return userData;
  }
}
