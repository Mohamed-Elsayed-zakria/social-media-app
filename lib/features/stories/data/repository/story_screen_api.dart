import 'package:flash/features/main_home/presentation/views/main_home_screen.dart';
import '../../../home/presentaion/controller/home_sceen_controller.dart';
import '../../presentation/controller/story_controller.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../../../core/constant/collections.dart';
import '../../../../core/api/api_service.dart';
import '../model/stories_model.dart';
import 'story_screen_repo.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';
import 'dart:io';

class StoryScreenApi extends StoryScreenRepo {
  @override
  Future<void> uploadeStory({
    required String type,
    String? description,
    String? imgPath,
  }) async {
    uploadeStoryIsLoading.value = true;
    String generatStoryId = const Uuid().v1();
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
}
