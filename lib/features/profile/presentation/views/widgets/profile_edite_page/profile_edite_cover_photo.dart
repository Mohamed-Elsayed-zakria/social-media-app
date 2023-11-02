import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';
import '../../../../../../core/utils/size_screen.dart';
import '../../../../../../core/widgets/custom_buttom.dart';
import '../../../controller/profile_edite_controller.dart';
import '../../../../../../core/constant/style.dart';
import 'profile_custom_buttom_edite.dart';
import 'package:flutter/material.dart';

class ProfileEditeCoverPhoto extends StatelessWidget {
  final String urlCoverPhoto;
  const ProfileEditeCoverPhoto({
    super.key,
    required this.urlCoverPhoto,
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
              onPressed: () => chooseImageCoverFromGalary(),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: Text(
                "cover Photo".tr,
                style: const TextStyle(fontSize: AppStyle.kTextStyle18),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Obx(
          () => Column(
            children: [
              updateImgPathCover.value == null
                  ? Container(
                      height: size.height * 0.20,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(urlCoverPhoto),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: SizedBox(
                        height: size.height * 0.20,
                        width: double.infinity,
                        child: Image.file(
                          updateImgPathCover.value!,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
              const SizedBox(height: 10),
              Visibility(
                visible: imgPathCoverLoding.value != null,
                child: CustomButton(
                  text: 'Edite'.tr,
                  onPressed: updateIsLodinge.value == false
                      ? () => uploadImageCover()
                      : null,
                ),
              ),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
