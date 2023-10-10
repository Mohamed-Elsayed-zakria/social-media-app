import 'package:cached_network_image/cached_network_image.dart';
import 'package:get/get.dart';

import '../../../../../../core/widgets/custom_buttom.dart';
import '../../../controller/profile_edite_controller.dart';
import '../../../../../../core/constant/constant.dart';
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
    final size = Constant.sizeScreen(context: context);

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
              child:  Text(
                "cover Photo".tr,
                style:const TextStyle(fontSize: AppStyle.kTextStyle18),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Obx(
          () => Column(
            children: [
              imgPathCover.value == null
                  ? Container(
                      height: size.height * 0.20,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(urlCoverPhoto),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : SizedBox(
                      height: size.height * 0.20,
                      width: double.infinity,
                      child: Image.file(
                        imgPathCover.value!,
                        fit: BoxFit.cover,
                      ),
                    ),
              const SizedBox(height: 10),
              coverUpdateIsLodinge.value
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: CircularProgressIndicator(),
                    )
                  : Visibility(
                      visible: imgPathCover.value != null,
                      child: CustomButton(
                        text: 'Edite'.tr,
                        onPressed: () => uploadImageCover(),
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
