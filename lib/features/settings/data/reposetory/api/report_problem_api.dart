import '../../../presentation/controllers/report_problem_controller.dart';
import '../../../../../core/constant/collections.dart';
import '../../../../../core/utils/snack_bar.dart';
import '../../../../../core/api/api_service.dart';
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
        snackBar(
          message: "Your message has been sent".tr,
          isError: false,
        );
      });
    }
  }
}
