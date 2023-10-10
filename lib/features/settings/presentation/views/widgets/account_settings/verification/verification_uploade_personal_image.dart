import 'package:flash/core/constant/assets.dart';

import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import '../../../../controllers/verification_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VerificationUploadePersonalImage extends StatelessWidget {
  const VerificationUploadePersonalImage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        Text(
          "addYourPersonalPhoto".tr,
          style: const TextStyle(
            fontSize: AppStyle.kTextStyle16,
            color: AppColors.kPrimaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 20, bottom: 30),
          child: InkWell(
            onTap: () => uploadImagePick(),
            child: Obx(
              () => CircleAvatar(
                radius: 75,
                backgroundColor: imgPathPick.value == null
                    ? AppColors.kOnSurfaceColor
                    : AppColors.kPrimaryColor,
                child: imgPathPick.value == null
                    ? CircleAvatar(
                        backgroundColor: AppColors.kSurfaceColor,
                        radius: 72,
                        backgroundImage: AssetImage(Assets.avater),
                      )
                    : ClipOval(
                        child: Image.file(
                          imgPathPick.value!,
                          width: 144,
                          height: 144,
                          fit: BoxFit.cover,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
