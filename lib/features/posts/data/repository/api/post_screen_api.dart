import '../../../../main_home/presentation/views/main_home_screen.dart';
import '../../../presentation/controllers/post_screen_controller.dart';
import '../../../../notifications/data/model/notice_model.dart';
import '../../../../../core/api/api_firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../../../core/api/api_dynamic_link.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/api/api_service.dart';
import '../../model/post_model.dart';
import '../post_screen_repo.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';
import 'dart:io';

class PostScreenApi implements PostScreenRepo {
  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getUserData(
      {required String currentUserUid}) {
    return ApiService.firestore
        .collection(Constant.userCollection)
        .doc(currentUserUid)
        .get();
  }

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
      type: TypeDynamicLink.post,
      short: false,
      id: generatId,
    );
    if (imagePaths.isNotEmpty) {
      for (var imageFile in imagePaths) {
        final ref = ApiService.fireStorage.ref().child(
              Constant.postImagesPath(generatId: generatId),
            );
        final task = await ref.putFile(File(imageFile));
        if (task.state == TaskState.success) {
          final downloadUrl = await ref.getDownloadURL();
          imageUrls.add(downloadUrl);
        }
      }
    }

    if (vedioPath.value != null) {
      final storageRef = FirebaseStorage.instance.ref(
        "post-user/${ApiService.user.uid}/post-videos/$vedioName",
      );
      await storageRef.putFile(vedioPath.value!);
      videoUrl = await storageRef.getDownloadURL();
    } else {
      videoUrl = '';
    }

    if (postStatus == "عام") {
      postStatus = "Public";
    } else if (postStatus == "خاص") {
      postStatus = "Private";
    } else if (postStatus == "المتابعين") {
      postStatus = "Followers";
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

    String currentUsername = await ApiService.getCurrentUsername();

    return await ApiService.firestore
        .collection(Constant.postCollection)
        .doc(generatId)
        .set(postModel.toJson())
        .then((value) {
      ApiFirebaseMessaging.sendNotfiy(
        username: currentUsername,
        noticeModel: noticeModel,
      );
      getDescriptionText.clear();
      vedioPath.value = null;
      imagePaths.removeRange(0, imagePaths.length);
      addPostLoading.value = false;
      Get.offAll(() => const MainHomeScreen());
    });
  }
}
