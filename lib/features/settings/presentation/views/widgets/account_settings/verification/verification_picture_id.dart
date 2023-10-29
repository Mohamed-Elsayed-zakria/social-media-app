import '../../../../../../../core/widgets/custom_buttom_sheet_take_photo.dart';
import '../../../../controllers/verification_controller.dart';
import '../../../../../../../core/utils/size_screen.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationPictureId extends StatelessWidget {
  const VerificationPictureId({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: InkWell(
        onTap: () {
          Get.bottomSheet(
            CustomButtomSheetTakePhoto(
              onTapFromGalary: () {
                uploadImageId(ImageSource.gallery);
                Get.back();
              },
              onTapFromCamera: () {
                uploadImageId(ImageSource.camera);
                Get.back();
              },
            ),
          );
        },
        child: Container(
          width: double.infinity,
          height: size.height * 0.25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: AppColors.kOnSurfaceColor,
              width: 1,
            ),
          ),
          child: Obx(
            () => imgPathId.value == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.add,
                        size: 40,
                        color: AppColors.kPrimaryColor,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        "addPictureTheIdCard".tr,
                        style: const TextStyle(
                          color: AppColors.kPrimaryColor,
                          fontSize: AppStyle.kTextStyle16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  )
                : Image.file(
                    imgPathId.value!,
                    width: double.infinity,
                    height: size.height * 0.25,
                    fit: BoxFit.cover,
                  ),
          ),
        ),
      ),
    );
  }
}
