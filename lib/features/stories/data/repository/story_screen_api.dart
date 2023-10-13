import 'package:flash/features/main_home/presentation/views/main_home_screen.dart';
import '../../../../core/constant/collections.dart';
import '../../../home/presentaion/controller/home_sceen_controller.dart';
import '../../presentation/controller/story_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../core/constant/constant.dart';
import '../../../../core/api/api_service.dart';
import '../model/stories_model.dart';
import 'story_screen_repo.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';
import 'dart:io';

class StoryScreenApi extends StoryScreenRepo {
  @override
  Future<DocumentSnapshot<Map<String, dynamic>>> getuserDataToStory(
      {required String otherUid}) {
    return ApiService.firestore
        .collection(Collections.userCollection)
        .doc(otherUid)
        .get();
  }

  @override
  Future<void> uploadeStory({
    required TypeStoryUploade type,
    String? description,
    String? imgPath,
    File? vedioPath,
  }) async {
    uploadeStoryIsLoading.value = true;
    String generatStoryId = const Uuid().v1();
    String? urlImgPath;
    String? videoUrl;
    try {
      if (imgPath != null) {
        final storageRef = ApiService.fireStorage.ref(
          Constant.userImagesStoryPath(generatStoryId: generatStoryId),
        );
        await storageRef.putFile(File(imgPath));
        urlImgPath = await storageRef.getDownloadURL();
      }

      if (vedioPath != null) {
        final storageRef = FirebaseStorage.instance.ref(
          "post-user/${ApiService.user.uid}/post-videos/$vedioName",
        );
        await storageRef.putFile(vedioPath);
        videoUrl = await storageRef.getDownloadURL();
      }

      StoriesModel storyModel = StoriesModel(
        datePublish: DateTime.timestamp().toString(),
        personUid: ApiService.user.uid,
        description: description,
        imgPath: urlImgPath,
        vedioUrl: videoUrl,
        type: type,
      );
      await ApiService.firestore
          .collection(Collections.userCollection)
          .doc(ApiService.user.uid)
          .collection(Collections.storyCollection)
          .add(storyModel.toJson())
          .then((value) {
        uploadeStoryIsLoading.value = false;
        if (vedioPath != null) {
          playerController!.pause();
        }
        Get.offAll(() => const MainHomeScreen());
        getTextStory.clear();
      });
    } catch (e) {
      uploadeStoryIsLoading.value = false;
    }
  }

  @override
  Future<String> getCurrentPersonalPicture() async {
    String personalPictureUrl = Constant.urlPhotoMale;
    DocumentSnapshot<Map<String, dynamic>> currentUserData = await ApiService
        .firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .get();
    Map<String, dynamic>? jsonAllData = currentUserData.data();
    if (jsonAllData != null) {
      personalPictureUrl = jsonAllData['personalPicture'];
    }
    return personalPictureUrl;
  }
}
