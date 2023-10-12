import '../../../../main_home/presentation/views/main_home_screen.dart';
import '../../../presentation/controllers/update_post_controller.dart';
import '../../../../../core/constant/constant.dart';
import '../../../../../core/api/api_service.dart';
import '../update_post_repo.dart';
import 'package:get/get.dart';

class UpdatePostApi implements UpdatePostRepo {
  @override
  Future<void> updatePost({required String postUid}) async {
    updatePostLoading.value = true;
    await ApiService.firestore
        .collection(Constant.postCollection)
        .doc(postUid)
        .update({'description': updatePostController.text}).then((value) {
      updatePostLoading.value = false;
      Get.off(() => const MainHomeScreen());
    }).catchError((e) {
      updatePostLoading.value = false;
    });
  }
}
