import '../../../presentation/controllers/post_screen_controller.dart';
import '../../../../notifications/data/model/notice_model.dart';
import '../../../../../core/api/api_firebase_messaging.dart';
import '../../../../../core/model/current_user_data.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../../../core/api/api_dynamic_link.dart';
import '../../../../../core/constant/collections.dart';
import '../../../../../core/api/api_service.dart';
import '../../model/post_model.dart';
import '../post_screen_repo.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';
import 'dart:io';

class PostScreenApi implements PostScreenRepo {
  @override
  Future createNewPost({
    required String description,
    required String postStatus,
  }) async {
    addPostLoading.value = true;
    String generatId = const Uuid().v1();
    List<String> imageUrls = [];
    String videoUrl;
    String postUrl = await ApiDynamicLink.createDynamicLink(
      type: TypeDynamicLink.post.name,
      short: false,
      id: generatId,
    );
    if (imagePaths.isNotEmpty) {
      for (var imageFile in imagePaths) {
        String generatImageId = const Uuid().v1();
        final ref = ApiService.fireStorage.ref().child(
              'posts/images/${ApiService.user.uid}/$generatId/$generatImageId.jpg',
            );
        final task = await ref.putFile(File(imageFile));
        if (task.state == TaskState.success) {
          final downloadUrl = await ref.getDownloadURL();
          imageUrls.add(downloadUrl);
        }
      }
    }

    if (addNewPostVedioPath.value != null) {
      String generatVideoId = const Uuid().v1();
      final storageRef = FirebaseStorage.instance.ref(
        "posts/videos/${ApiService.user.uid}/$generatId/$generatVideoId.mp4",
      );
      await storageRef.putFile(addNewPostVedioPath.value!);
      videoUrl = await storageRef.getDownloadURL();
    } else {
      videoUrl = '';
    }

    if (postStatus == "عام") {
      postStatus = "Public";
    } else if (postStatus == "خاص") {
      postStatus = "Private";
    } else if (postStatus == "أتابعهم") {
      postStatus = "Following";
    }

    PostModel postModel = PostModel(
      datePublished: DateTime.timestamp().toString(),
      personUid: ApiService.user.uid,
      description: description,
      postStatus: postStatus,
      videoUrl: videoUrl,
      postUid: generatId,
      imgUrl: imageUrls,
      postUrl: postUrl,
    );
    NoticeModel noticeModel = NoticeModel(
      sentTo: "/topics/${ApiService.user.uid}",
      personUid: ApiService.user.uid,
      textTitle: 'New Post',
      textBody: 'published a new post',
      type: NoticeType.post.name,
    );

    return await ApiService.firestore
        .collection(Collections.postCollection)
        .doc(generatId)
        .set(postModel.toJson())
        .then((value) {
      getDescriptionText.clear();
      ApiFirebaseMessaging.sendNotfiy(
        username: CurrentUserData.username,
        noticeModel: noticeModel,
      );
      if (addNewPostVedioPath.value != null) {
        addNewPostplayerController!.dispose();
        addNewPostVedioPath.value = null;
      }
      imagePaths.removeRange(0, imagePaths.length);
      addPostLoading.value = false;
      Get.back();
    }).catchError((e) {
      addPostLoading.value = false;
    });
  }
}
