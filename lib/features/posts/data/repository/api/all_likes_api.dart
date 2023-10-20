import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/collections.dart';
import '../../model/likes_model.dart';
import '../all_likes_repo.dart';

class AllLikesApi extends AllLikesRepo {
  @override
  Future<List<LikesModel>> getAllLikesByUid({required String postUid}) async {
    List<LikesModel> allLikes = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await FirebaseFirestore
        .instance
        .collection(Collections.postCollection)
        .doc(postUid)
        .collection(Collections.likesCollection)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      for (var doc in querySnapshot.docs) {
        var data = doc.data();
        DocumentSnapshot<Map<String, dynamic>> userDataDoc = await ApiService
            .firestore
            .collection(Collections.userCollection)
            .doc(data['personUid'])
            .get();
        if (userDataDoc.exists) {
          var userData = userDataDoc.data();
          LikesModel likesModel = LikesModel.fromJson(userData!);
          allLikes.add(likesModel);
        }
      }
    }
    return allLikes;
  }
}
