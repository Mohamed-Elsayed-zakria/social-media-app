import 'package:flash/core/api/api_firebase_messaging.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/constant/collections.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../notifications/data/model/notice_model.dart';
import '../../../../posts/data/model/post_model.dart';
import '../../models/profile_model.dart';
import '../profile_screen_repo.dart';

class ProfileScreenApi implements ProfileScreenRepo {
  @override
  Stream<DocumentSnapshot<Map<String, dynamic>>> getDataToProfileScreen({
    required String otherUid,
  }) {
    return ApiService.firestore
        .collection(Collections.userCollection)
        .doc(otherUid)
        .snapshots();
  }

  @override
  Future<List<PostModel>> getPostsForSpecificPerson({
    required String otherUid,
  }) async {
    List<PostModel> allPosts = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
        .firestore
        .collection(Collections.postCollection)
        .where('personUid', isEqualTo: otherUid)
        .get();
    if (querySnapshot.docs.isNotEmpty) {
      Map<String, dynamic> allData = {};
      for (var doc in querySnapshot.docs) {
        var data = doc.data();
        DocumentSnapshot<Map<String, dynamic>> userDataDoc = await ApiService
            .firestore
            .collection(Collections.userCollection)
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

  @override
  Future<void> tapFolow({required ProfileScreenModel userData}) async {
    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(userData.personalUid)
        .update({
      "followers": FieldValue.arrayUnion([ApiService.user.uid])
    });

    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .update({
      "following": FieldValue.arrayUnion([userData.personalUid])
    });

    String currentUsername = await ApiService.getCurrentUsername();

    NoticeModel noticeModel = NoticeModel(
      personUid: ApiService.user.uid,
      type: NoticeType.profile.name,
      textBody: 'Do you want to follow up on him ?',
      textTitle: 'He followed you',
      sentTo: userData.token,
    );



    ApiFirebaseMessaging.sendNotfiy(
      username: currentUsername,
      noticeModel: noticeModel,
    );
  }

  @override
  Future<void> tapUnfolow({required ProfileScreenModel userData}) async {
    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(userData.personalUid)
        .update({
      "followers": FieldValue.arrayRemove([ApiService.user.uid])
    });

    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .update({
      "following": FieldValue.arrayRemove([userData.personalUid])
    });

    await ApiService.firebaseMessaging
        .unsubscribeFromTopic(userData.personalUid);
  }
}
