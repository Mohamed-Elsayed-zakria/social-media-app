import 'package:carousel_slider/carousel_controller.dart';
import '../../data/repository/api/custom_post_api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/model/post_model.dart';
import 'package:get/get.dart';

// ========photos===========
final controller = CarouselController();
RxInt activeIndex = 0.obs;
//==========================

Stream<QuerySnapshot<Map<String, dynamic>>> getPostComments({
  required String postUid,
}) {
  return CustomPostApi().getPostComments(postUid: postUid);
}

Future<List<PostModel>> getPostDetails({required String postId}) async {
  return CustomPostApi().getPostDetails(postId: postId);
}

Stream<QuerySnapshot<Map<String, dynamic>>> getPostLikes({
  required String postUid,
}) {
  return CustomPostApi().getPostLikes(postUid: postUid);
}

Future<DocumentSnapshot<Map<String, dynamic>>> getUserData({
  required String personUid,
}) {
  return CustomPostApi().getUserData(personUid: personUid);
}

Future<void> addLikeToPost({required String postId}) async {
  CustomPostApi().addLikeToPost(postId: postId);
}

Future<void> removeLikeToPost({required String postId}) async {
  CustomPostApi().removeLikeToPost(postId: postId);
}

Future<void> reportThePost({required PostModel data}) async {
  CustomPostApi().reportThePost(data: data);
}

Future<void> deletePost({required PostModel data}) async {
  CustomPostApi().deletePost(data: data);
}

Future<void> addSavedItems({required PostModel data}) async {
  CustomPostApi().addSavedItems(data: data);
}
