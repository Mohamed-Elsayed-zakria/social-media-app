import '../../../../../core/constant/collections.dart';
import '../../../presentation/controllers/report_problem_controller.dart';
import '../../../../../core/api/api_service.dart';
import '../../../../../core/constant/colors.dart';
import '../report_problem_repo.dart';
import 'package:get/get.dart';

class ReportProblemApi extends ReportProblemRepo {
  @override
  Future<void> sentReportProblemMessage({required String text}) async {
    if (text.isNotEmpty) {
      await ApiService.firestore
          .collection(Collections.reportProblemCollection)
          .doc(ApiService.user.uid)
          .set({
        'message': text,
        'personUid': ApiService.user.uid,
      }).then((value) {
        getMessageReportProblem.clear();
        Get.snackbar(
          "Done".tr,
          "Your message has been sent".tr,
          backgroundColor: AppColors.kSecondeColor,
          colorText: AppColors.kSurfaceColor,
        );
      });
    }
  }
}
