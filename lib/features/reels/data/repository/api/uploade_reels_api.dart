import '../../../presentation/controller/uploade_reels_controller.dart';
import '../../../../../core/utils/get_current_date_time.dart';
import '../../../../../core/constant/collections.dart';
import '../../../../../core/api/api_dynamic_link.dart';
import '../../../../../core/api/api_service.dart';
import '../../model/reels_model.dart';
import '../uploade_reels_repo.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';

class UploadeReelsApi implements UploadeReelsRepo {
  @override
  Future<void> uploadeVideoReels({
    required String postStatus,
    String? description,
  }) async {
    uploadeReelsIsLoading.value = true;
    DateTime getCurrentDateTime = await getServerTime();
    String generatId = const Uuid().v1();
    String videoUrl;
    try {
      final storageRef = ApiService.fireStorage.ref(
        "user-files/${ApiService.user.uid}/video/reels/$generatId.mp4",
      );
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
      } else if (postStatus == "أتابعهم") {
        postStatus = "Following";
      }

      ReelsModel videoReelsModel = ReelsModel(
        datePublished: getCurrentDateTime.toString(),
        personUid: ApiService.user.uid,
        description: description,
        postStatus: postStatus,
        reelUid: generatId,
        videoUrl: videoUrl,
        postUrl: postUrl,
      );

      ApiService.firestore
          .collection(Collections.reelsCollection)
          .doc(generatId)
          .set(videoReelsModel.toJson())
          .then((value) {
        uploadeReelsIsLoading.value = false;
        getDescriptionReels?.clear();
        if (addVideoReelsPath != null) {
          addVideoReelsPath = null;
          addVideoReelsController!.dispose();
        }
        Get.back();
      });
    } catch (e) {
      uploadeReelsIsLoading.value = false;
    }
  }
}
