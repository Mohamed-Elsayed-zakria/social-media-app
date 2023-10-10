import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash/features/posts/data/model/post_model.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/api/api_service.dart';
import '../saved_items_repo.dart';

class SavedItemsApi extends SavedItemsRepo {
  @override
  Future<List<PostModel>> getPostsToSavedItems() async {
    List<PostModel> userPosts = [];

    DocumentSnapshot<Map<String, dynamic>> currentUserData = await ApiService
        .firestore
        .collection(Constant.userCollection)
        .doc(ApiService.user.uid)
        .get();

    Map<String, dynamic>? jsonSavedItems = currentUserData.data();
    if (jsonSavedItems != null) {
      List postsUid = jsonSavedItems['savedItems'] ?? [];
      if (postsUid.isNotEmpty) {
        for (var element in postsUid) {
          QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
              .firestore
              .collection(Constant.postCollection)
              .where('postUid', isEqualTo: element)
              .get();

          if (querySnapshot.docs.isNotEmpty) {
            Map<String, dynamic> allData = {};
            for (var doc in querySnapshot.docs) {
              var data = doc.data();
              DocumentSnapshot<Map<String, dynamic>> userDataDoc =
                  await ApiService.firestore
                      .collection(Constant.userCollection)
                      .doc(data['personUid'])
                      .get();
              if (userDataDoc.exists) {
                var userData = userDataDoc.data();
                data.addAll(userData!);
                allData = data;
                PostModel postModel = PostModel.fromJson(allData);
                userPosts.add(postModel);
              }
            }
          }
        }
      }
    }
    return userPosts;
  }
}
