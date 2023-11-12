import '../../../../../core/constant/collections.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../model/reels_model.dart';
import '../show_reels_repo.dart';
import 'package:get/get.dart';
import 'dart:async';

class ShowReelsApi implements ShowReelsRepo {
  @override
  Future<List<ReelsModel>> getAllReels() async {
    List<ReelsModel> allReels = [];

    DocumentSnapshot<Map<String, dynamic>> currentUserData = await ApiService
        .firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .get();

    List<String> followers = List<String>.from(
      currentUserData['followers'],
    );

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
          if (allData['personUid'] == ApiService.user.uid) {
            ReelsModel postModel = ReelsModel.fromJson(allData);
            allReels.add(postModel);
          } else if (allData['postStatus'] == "Following") {
            if (followers.contains(allData['personUid'])) {
              ReelsModel postModel = ReelsModel.fromJson(allData);
              allReels.add(postModel);
            }
          } else {
            ReelsModel postModel = ReelsModel.fromJson(allData);
            allReels.add(postModel);
          }
        }
      }
    }
    return allReels;
  }

  @override
  Stream<List> getReelsLikes({required String reelsUid}) {
    final StreamController<List> likesController = StreamController<List>();

    FirebaseFirestore.instance
        .collection(Collections.reelsCollection)
        .doc(reelsUid)
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
  Stream<int> getCommentReelsCount({required String reelsUid}) {
    return ApiService.firestore
        .collection(Collections.reelsCollection)
        .doc(reelsUid)
        .collection(Collections.commentsCollection)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      return snapshot.docs.length;
    });
  }

  @override
  Future<void> addLikeToReels({required String reelsUid}) async {
    await ApiService.firestore
        .collection(Collections.reelsCollection)
        .doc(reelsUid)
        .collection(Collections.likesCollection)
        .doc(ApiService.user.uid)
        .set({
      'personUid': ApiService.user.uid,
    });
  }

  @override
  Future<void> removeLikeToReels({required String reelsUid}) async {
    await ApiService.firestore
        .collection(Collections.reelsCollection)
        .doc(reelsUid)
        .collection(Collections.likesCollection)
        .doc(ApiService.user.uid)
        .delete();
  }

  @override
  Future<void> reportReels({required ReelsModel reelsModel}) async {
    Map<String, dynamic> additionalData = {
      'idMakeReport': ApiService.user.uid,
    };

    Map<String, dynamic> dataToUpdate = reelsModel.toJson();
    dataToUpdate.addAll(additionalData);

    ApiService.firestore
        .collection(Collections.reportReelsCollection)
        .add(dataToUpdate)
        .then(
          (value) => showToast(msg: 'The reel clip has been reported'.tr),
        );
  }

  @override
  Future<void> deleteReels({required String reelsUid}) async {
    final reelsRef = ApiService.firestore
        .collection(Collections.reelsCollection)
        .doc(reelsUid);

    await reelsRef.delete().then(
          (value) => showToast(msg: "The reel has been deleted".tr),
        );

    final subCollection1Ref =
        reelsRef.collection(Collections.commentsCollection);
    final subCollection1Docs = await subCollection1Ref.get();

    for (final doc in subCollection1Docs.docs) {
      await doc.reference.delete();
    }

    final subCollection2Ref = reelsRef.collection(Collections.likesCollection);
    final subCollection2Docs = await subCollection2Ref.get();

    for (final doc in subCollection2Docs.docs) {
      await doc.reference.delete();
    }
  }
}
