import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash/features/posts/data/model/post_model.dart';
import '../../../../core/api/api_service.dart';
import '../../../../core/constant/constant.dart';
import 'video_screen_repo.dart';

class VideoScreenApi implements VideoScreenRepo {
  @override
  Future<List<PostModel>> getPostsOfTypeVideos() async {
    List<PostModel> allPosts = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
        .firestore
        .collection(Constant.postCollection)
        .where('videoUrl', isNotEqualTo: '')
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      Map<String, dynamic> allData = {};
      for (var doc in querySnapshot.docs) {
        var data = doc.data();
        DocumentSnapshot<Map<String, dynamic>> userDataDoc = await ApiService
            .firestore
            .collection(Constant.userCollection)
            .doc(data['personUid'])
            .get();
        if (userDataDoc.exists) {
          var userData = userDataDoc.data();
          data.addAll(userData!);
          allData = data;
          PostModel postModel = PostModel.fromJson(allData);
          allPosts.add(postModel);
        }
      }
    }
    return allPosts;
  }
}
