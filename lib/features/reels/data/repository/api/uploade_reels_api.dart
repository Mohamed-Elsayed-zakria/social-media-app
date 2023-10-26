import '../../../presentation/controller/uploade_video_reels_controller.dart';
import '../../../../main_home/presentation/views/main_home_screen.dart';
import '../../../../../core/constant/collections.dart';
import '../../../../../core/api/api_dynamic_link.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/api/api_service.dart';
import '../../model/video_reels_model.dart';
import '../uploade_reels_repo.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

class UploadeReelsApi implements UploadeReelsRepo {
  @override
  Future<void> uploadeVideoReels({
    required String postStatus,
    String? description,
  }) async {
    String generatId = const Uuid().v1();
    String videoUrl;

    final storageRef = ApiService.fireStorage.ref(Constant.reelsPath);
    await storageRef.putFile(addVideoReelsPath!);
    videoUrl = await storageRef.getDownloadURL();

    String postUrl = await ApiDynamicLink.createDynamicLink(
      type: TypeDynamicLink.reels.name,
      short: false,
      id: generatId,
    );

    if (postStatus == "عام") {
      postStatus = "Public";
    } else if (postStatus == "خاص") {
      postStatus = "Private";
    } else if (postStatus == "المتابعين") {
      postStatus = "Followers";
    }

    VideoReelsModel videoReelsModel = VideoReelsModel(
      datePublished: DateTime.timestamp().toString(),
      personUid: ApiService.user.uid,
      description: description,
      postStatus: postStatus,
      videoUid: generatId,
      videoUrl: videoUrl,
      postUrl: postUrl,
    );

    ApiService.firestore
        .collection(Collections.reelsCollection)
        .doc(generatId)
        .set(videoReelsModel.toJson())
        .then((value) {
      getDescriptionReels?.clear();
      addVideoReelsPath = null;
      Get.off(() => const MainHomeScreen());
    });
  }
}