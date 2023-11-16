import '../../../../../../core/widgets/custom_buttom_sheet_take_photo.dart';
import '../../../controllers/add_details_controller.dart';
import '../../../../../../core/utils/size_screen.dart';
import '../../../../../../core/constant/assets.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddDetailsCustomCircleAvatar extends StatelessWidget {
  const AddDetailsCustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        children: [
          Text(
            'Add photo'.tr,
            style: const TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: AppStyle.kTextStyle20,
            ),
          ),
          GetBuilder<AddDetailsController>(
            init: AddDetailsController(),
            builder: (controller) => GestureDetector(
              onTap: () {
                Get.bottomSheet(
                  CustomButtomSheetTakePhoto(
                    onTapFromGalary: () {
                      controller.uploadImage(source: ImageSource.gallery);
                      Get.back();
                    },
                    onTapFromCamera: () {
                      controller.uploadImage(source: ImageSource.camera);
                      Get.back();
                    },
                  ),
                );
              },
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 20),
                    child: CircleAvatar(
                      backgroundColor: addDetailsImgPath == null
                          ? AppColors.kOnSurfaceColor
                          : AppColors.kPrimaryColor,
                      radius: size.width * .21,
                      child: addDetailsImgPath == null
                          ? CircleAvatar(
                              radius: size.width * .2,
                              backgroundImage: AssetImage(Assets.avater),
                              backgroundColor: AppColors.kSurfaceColor,
                            )
                          : ClipOval(
                              child: Image.file(
                                addDetailsImgPath!,
                                width: size.width * .4,
                                height: size.width * .4,
                                fit: BoxFit.cover,
                              ),
                            ),
                    ),
                  ),
                  Positioned(
                    bottom: 28,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: addDetailsImgPath == null
                            ? AppColors.kOnSurfaceColor
                            : AppColors.kPrimaryColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(
                        color: AppColors.kSurfaceColor,
                        Icons.add_a_photo_outlined,
                        size: 28,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
