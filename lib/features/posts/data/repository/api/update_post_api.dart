import '../../../presentation/controllers/update_post_controller.dart';
import '../../../../../core/constant/collections.dart';
import '../../../../../core/api/api_service.dart';
import '../update_post_repo.dart';
import 'package:get/get.dart';

class UpdatePostApi implements UpdatePostRepo {
  @override
  Future<void> updatePost({
    required String postUid,
    required String postStatus,
  }) async {
    updatePostLoading.value = true;
    if (postStatus == "عام") {
      postStatus = "Public";
    } else if (postStatus == "خاص") {
      postStatus = "Private";
    } else if (postStatus == "أتابعهم") {
      postStatus = "Following";
    }

    await ApiService.firestore
        .collection(Collections.postCollection)
        .doc(postUid)
        .update({
      'description': updatePostController.text,
      'postStatus': postStatus,
    }).then((value) {
      updatePostLoading.value = false;
      Get.back();
    }).catchError((e) {
      updatePostLoading.value = false;
    });
  }
}
