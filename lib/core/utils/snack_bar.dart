import '../constant/colors.dart';
import 'package:get/get.dart';

snackBar({required String message, required bool isError}) {
  Get.snackbar(
    isError ? "Error".tr : "Done".tr,
    message,
    backgroundColor: isError ? AppColors.kErrorColor : AppColors.kSecondeColor,
    colorText: AppColors.kSurfaceColor,
  );
}
