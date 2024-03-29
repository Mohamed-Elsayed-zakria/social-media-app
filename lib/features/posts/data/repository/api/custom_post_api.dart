import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/constant/collections.dart';
import '../../../../../core/model/current_user_data.dart';
import '../../../../../core/utils/show_toast.dart';
import '../../../../../core/api/api_service.dart';
import '../../model/report_post.dart';
import '../../model/post_model.dart';
import '../custom_post_repo.dart';
import 'package:get/get.dart';
import 'dart:async';

class CustomPostApi implements CustomPostRepo {
  @override
  Stream<int> getCommentCount({required String postUid}) {
    return ApiService.firestore
        .collection(Collections.postCollection)
        .doc(postUid)
        .collection(Collections.commentsCollection)
        .snapshots()
        .map((QuerySnapshot snapshot) {
      return snapshot.docs.length;
    });
  }

  @override
  Stream<List> getPostLikes({required String postUid}) {
    final StreamController<List> likesController = StreamController<List>();
    ApiService.firestore
        .collection(Collections.postCollection)
        .doc(postUid)
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
  Future<void> addLikeToPost({required String postId}) async {
    await ApiService.firestore
        .collection(Collections.postCollection)
        .doc(postId)
        .collection(Collections.likesCollection)
        .doc(ApiService.user.uid)
        .set({
      'personUid': ApiService.user.uid,
    });
  }

  @override
  Future<void> removeLikeToPost({required String postId}) async {
    await ApiService.firestore
        .collection(Collections.postCollection)
        .doc(postId)
        .collection(Collections.likesCollection)
        .doc(ApiService.user.uid)
        .delete();
  }

  @override
  Future<void> reportThePost({required PostModel data}) async {
    ReportPost reportPost = ReportPost(
      idMakeReport: ApiService.user.uid,
      postUid: data.postUid,
      idMakePost: data.personUid,
      description: data.description,
      imgUrl: data.imgUrl,
      videoUrl: data.videoUrl,
      datePublished: data.datePublished,
    );
    await ApiService.firestore
        .collection(Collections.reportPostCollection)
        .add(reportPost.toJson());
  }

  @override
  Future<void> deletePost({required PostModel data}) async {
    final postRef = ApiService.firestore
        .collection(Collections.postCollection)
        .doc(data.postUid);

    await postRef.delete().then(
          (value) => showToast(msg: "The Post has been deleted".tr),
        );

    final subCollection1Ref =
        postRef.collection(Collections.commentsCollection);
    final subCollection1Docs = await subCollection1Ref.get();
    for (final doc in subCollection1Docs.docs) {
      await doc.reference.delete();
    }

    final subCollection2Ref = postRef.collection(Collections.likesCollection);
    final subCollection2Docs = await subCollection2Ref.get();
    for (final doc in subCollection2Docs.docs) {
      await doc.reference.delete();
    }
  }

  @override
  Future<List<PostModel>> getPostDetails({required String postId}) async {
    List<PostModel> allPosts = [];
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await ApiService
        .firestore
        .collection(Collections.postCollection)
        .where('postUid', isEqualTo: postId)
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
  Future<void> addPostSavedItems({required PostModel data}) async {
    CurrentUserData.savedItems.add(data.postUid);
    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .update({
      "savedItems": FieldValue.arrayUnion([data.postUid])
    });
  }

  @override
  Future<void> removePostSavedItems({required PostModel data}) async {
    CurrentUserData.savedItems.remove(data.postUid);
    await ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .update({
      "savedItems": FieldValue.arrayRemove([data.postUid])
    });
  }
}
