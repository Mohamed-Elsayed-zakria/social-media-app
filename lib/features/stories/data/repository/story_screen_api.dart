import '../../../home/presentaion/controller/home_sceen_controller.dart';
import '../../../main_home/presentation/views/main_home_screen.dart';
import '../../presentation/controller/story_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../../core/constant/collections.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
  }) async {
    String currentDate = DateTime.timestamp().toString();
    String generatStoryId = const Uuid().v1();
    uploadeStoryIsLoading.value = true;
    String? urlImgPath;
    String? videoUrl;
    try {
      if (imgPath != null) {
        String generatStoryImageId = const Uuid().v1();
        final storageRef = ApiService.fireStorage.ref(
          "stories/images/${ApiService.user.uid}/$generatStoryId/$generatStoryImageId.jpg",
        );
        await storageRef.putFile(File(imgPath));
        urlImgPath = await storageRef.getDownloadURL();
      }

      if (addNewStoryVedioPath != null) {
        String generatStoryVideoId = const Uuid().v1();
        final storageRef = FirebaseStorage.instance.ref(
          "stories/videos/${ApiService.user.uid}/$generatStoryId/$generatStoryVideoId.mp4",
        );
        await storageRef.putFile(addNewStoryVedioPath!);
        videoUrl = await storageRef.getDownloadURL();
      }

      StoriesModel storyModel = StoriesModel(
        personUid: ApiService.user.uid,
        durationTime: durationTime,
        description: description,
        datePublish: currentDate,
        imgPath: urlImgPath,
        vedioUrl: videoUrl,
        type: type,
        storyUid: generatStoryId,
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
        if (addNewStoryVedioPath != null) {
          addNewStoryVedioPath = null;
          addNewStoryPlayerController!.dispose();
        }
        Get.offAll(() => const MainHomeScreen());
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
          (value) => Fluttertoast.showToast(
            msg: "The story has been deleted".tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          ),
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
          (value) => Fluttertoast.showToast(
            msg: "The story has been reported".tr,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
          ),
        );
  }
}
