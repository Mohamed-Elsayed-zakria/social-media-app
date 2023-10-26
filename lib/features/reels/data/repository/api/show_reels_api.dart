import '../../../../../core/constant/collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../../model/video_reels_model.dart';
import '../show_reels_repo.dart';
import 'dart:async';

class ShowReelsApi implements ShowReelsRepo {
  @override
  Future<List<VideoReelsModel>> getAllReels() async {
    List<VideoReelsModel> allReels = [];

    QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
        .firestore
        .collection(Collections.reelsCollection)
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
          VideoReelsModel postModel = VideoReelsModel.fromJson(allData);
          allReels.add(postModel);
        }
      }
    }
    return allReels;
  }

  @override
  Stream<List> getReelsLikes({required String videoUid}) {
    final StreamController<List> likesController = StreamController<List>();

    FirebaseFirestore.instance
        .collection(Collections.reelsCollection)
        .doc(videoUid)
        .collection(Collections.likesCollection)
        .snapshots()
        .listen((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
      List likesData =
          querySnapshot.docs.map((doc) => doc['personUid']).toList();
      likesController.add(likesData);
    });

    return likesController.stream;
  }

  @override
  Future<void> addLikeToReels({required String videoUid}) async {
    await ApiService.firestore
        .collection(Collections.reelsCollection)
        .doc(videoUid)
        .collection(Collections.likesCollection)
        .doc(ApiService.user.uid)
        .set({
      'personUid': ApiService.user.uid,
    });
  }

  @override
  Future<void> removeLikeToReels({required String videoUid}) async {
    await ApiService.firestore
        .collection(Collections.reelsCollection)
        .doc(videoUid)
        .collection(Collections.likesCollection)
        .doc(ApiService.user.uid)
        .delete();
  }
}
