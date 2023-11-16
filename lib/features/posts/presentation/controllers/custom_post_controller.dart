import 'package:carousel_slider/carousel_controller.dart';
import '../../data/repository/api/custom_post_api.dart';
import '../../data/model/post_model.dart';
import 'package:get/get.dart';

// ========photos===========
final controller = CarouselController();
RxInt activeIndex = 0.obs;
//==========================

Stream<int> getCommentCount({required String postUid}) {
  return CustomPostApi().getCommentCount(postUid: postUid);
}

Stream<List> getPostLikes({required String postUid}) {
  return CustomPostApi().getPostLikes(postUid: postUid);
}

Future<List<PostModel>> getPostDetails({required String postId}) async {
  return CustomPostApi().getPostDetails(postId: postId);
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

Future<void> addPostSavedItems({required PostModel data}) async {
  CustomPostApi().addPostSavedItems(data: data);
}

Future<void> removePostSavedItems({required PostModel data}) async {
  CustomPostApi().removePostSavedItems(data: data);
}
