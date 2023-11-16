import '../../../home/presentaion/controller/home_sceen_controller.dart';
import '../../presentation/controller/uploade_story_controller.dart';
import '../../../../core/utils/get_current_date_time.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../../core/constant/collections.dart';
import '../../../../core/utils/show_toast.dart';
import '../../../../core/api/api_service.dart';
import '../model/stories_model.dart';
import 'story_screen_repo.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';
import 'dart:io';

class StoryScreenApi extends StoryScreenRepo {
  @override
  Future<void> uploadeStory({
    required int durationTime,
    required String type,
    String? description,
    String? imgPath,
    String? color,
  }) async {
    uploadeStoryIsLoading.value = true;
    DateTime getCurrentDateTime = await getServerTime();
    String currentDate = getCurrentDateTime.toString();
    String generatStoryId = const Uuid().v1();
    String? urlImgPath;
    String? videoUrl;
    try {
      if (imgPath != null) {
        String generatStoryImageId = const Uuid().v1();
        final storageRef = ApiService.fireStorage.ref(
          'user-files/${ApiService.user.uid}/images/stories/$generatStoryId/$generatStoryImageId.jpg',
        );
        await storageRef.putFile(File(imgPath));
        urlImgPath = await storageRef.getDownloadURL();
      }

      if (addNewStoryVedioPath != null) {
        String generatStoryVideoId = const Uuid().v1();
        final storageRef = FirebaseStorage.instance.ref(
          'user-files/${ApiService.user.uid}/video/stories/$generatStoryId/$generatStoryVideoId.mp4',
        );
        await storageRef.putFile(addNewStoryVedioPath!);
        videoUrl = await storageRef.getDownloadURL();
      }

      StoriesModel storyModel = StoriesModel(
        personUid: ApiService.user.uid,
        durationTime: durationTime,
        description: description,
        datePublish: currentDate,
        storyUid: generatStoryId,
        imgPath: urlImgPath,
        vedioUrl: videoUrl,
        color: color,
        type: type,
      );
      await ApiService.firestore
          .collection(Collections.userCollection)
          .doc(ApiService.user.uid)
          .collection(Collections.storyCollection)
          .doc(generatStoryId)
          .set(storyModel.toJson())
          .then((value) {
        uploadeStoryIsLoading.value = false;
        getTextStory.clear();
        selectColorIndex = 0;
        if (addNewStoryVedioPath != null) {
          addNewStoryVedioPath = null;
          addNewStoryPlayerController!.dispose();
        }
        Get.back();
      });
    } catch (e) {
      uploadeStoryIsLoading.value = false;
    }
  }

  @override
  Future<void> deleteStory({required String storyUid}) async {
    ApiService.firestore
        .collection(Collections.userCollection)
        .doc(ApiService.user.uid)
        .collection(Collections.storyCollection)
        .doc(storyUid)
        .delete()
        .then(
          (value) => showToast(msg: "The story has been deleted".tr),
        );
  }

  @override
  Future<void> reportStory({required StoriesModel storyData}) async {
    Map<String, dynamic> additionalData = {
      'idMakeReport': ApiService.user.uid,
    };

    Map<String, dynamic> dataToUpdate = storyData.toJson();
    dataToUpdate.addAll(additionalData);

    ApiService.firestore
        .collection(Collections.reportStoryCollection)
        .add(dataToUpdate)
        .then(
          (value) => showToast(msg: "The story has been reported".tr),
        );
  }
}
