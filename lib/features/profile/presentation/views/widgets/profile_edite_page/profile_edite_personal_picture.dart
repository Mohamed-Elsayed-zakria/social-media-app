import '../../../../../../core/utils/size_screen.dart';
import '../../../../../../core/widgets/custom_buttom.dart';
import '../../../controller/profile_edite_controller.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import 'profile_custom_buttom_edite.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileEditePersonalPicture extends StatelessWidget {
  final String urlPersonalPicture;

  const ProfileEditePersonalPicture({
    super.key,
    required this.urlPersonalPicture,
  });

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProfileCustomButtomEdite(
              onPressed: () => chooseImagePictureFromGalary(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                'personal picture'.tr,
                style: const TextStyle(fontSize: AppStyle.kTextStyle18),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Obx(() => Column(
              children: [
                imgPathPicture.value == null
                    ? CircleAvatar(
                        radius: size.width * .18,
                        backgroundColor: AppColors.kBackgroundColor,
                        child: CircleAvatar(
                          backgroundColor: AppColors.kSurfaceColor,
                          radius: size.width * .17,
                          backgroundImage:
                              CachedNetworkImageProvider(urlPersonalPicture),
                        ),
                      )
                    : ClipOval(
                        child: Image.file(
                          imgPathPicture.value!,
                          width: size.width * .4,
                          height: size.width * .4,
                          fit: BoxFit.cover,
                        ),
                      ),
                const SizedBox(height: 10),
                Visibility(
                  visible: imgPathPicture.value != null,
                  child: CustomButton(
                    text: 'Edite'.tr,
                    onPressed: updateIsLodinge.value == false
                        ? () => uploadImagePicture()
                        : null,
                  ),
                ),
              ],
            )),
        const Divider(),
      ],
    );
  }
}
