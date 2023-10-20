import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/constant/collections.dart';
import '../../data/model/video_reels_model.dart';
import 'package:video_player/video_player.dart';
import '../../../../core/api/api_service.dart';
import 'package:get/get.dart';
import 'dart:async';

RxBool showVideoIsPlaying = false.obs;
RxBool showVideoIsShowIcon = false.obs;

void showVideoPlayAndPauseVideo({
  required VideoPlayerController playerControllerPlay,
}) {
  if (playerControllerPlay.value.isPlaying) {
    playerControllerPlay.pause();
    showVideoIsPlaying.value = true;
    showVideoIsShowIcon.value = true;
    Future.delayed(
      const Duration(seconds: 1),
      () => showVideoIsShowIcon.value = false,
    );
  } else {
    playerControllerPlay.play();
    showVideoIsPlaying.value = false;
    showVideoIsShowIcon.value = true;
    Future.delayed(
      const Duration(seconds: 1),
      () => showVideoIsShowIcon.value = false,
    );
  }
}

Future<List<VideoReelsModel>> getAllReels() async {
  List<VideoReelsModel> allReels = [];

  QuerySnapshot<Map<String, dynamic>> querySnapshot =
      await ApiService.firestore.collection(Collections.reelsCollection).get();

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

Stream<List> getReelsLikes({required String videoUid}) {
  final StreamController<List> likesController = StreamController<List>();

  FirebaseFirestore.instance
      .collection(Collections.reelsCollection)
      .doc(videoUid)
      .collection(Collections.likesCollection)
      .snapshots()
      .listen((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
    List likesData = querySnapshot.docs.map((doc) => doc['personUid']).toList();
    likesController.add(likesData);
  });

  return likesController.stream;
}

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

Future<void> removeLikeToReels({required String videoUid}) async {
  await ApiService.firestore
      .collection(Collections.reelsCollection)
      .doc(videoUid)
      .collection(Collections.likesCollection)
      .doc(ApiService.user.uid)
      .delete();
}


// Stream<List> getReelsComments({required String videoUid}) {
//   final StreamController<List> likesController = StreamController<List>();

//   FirebaseFirestore.instance
//       .collection(Collections.reelsCollection)
//       .doc(videoUid)
//       .collection(Collections.commentsCollection)
//       .snapshots()
//       .listen((QuerySnapshot<Map<String, dynamic>> querySnapshot) {
//     List likesData = querySnapshot.docs.map((doc) => doc['personUid']).toList();
//     likesController.add(likesData);
//   });

//   return likesController.stream;
// }