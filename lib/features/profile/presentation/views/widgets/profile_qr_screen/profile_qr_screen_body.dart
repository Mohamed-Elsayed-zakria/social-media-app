import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/model/current_user_data.dart';
import '../../../../../../core/constant/constant.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:barcode_widget/barcode_widget.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileQrScreenBody extends StatelessWidget {
  const ProfileQrScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return Center(
      child: SizedBox(
        height: size.height * .6,
        child: Stack(
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: size.width * .7,
              child: AspectRatio(
                aspectRatio: 3 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
            Column(
              children: [
                CircleAvatar(
                  radius: size.width * .17,
                  backgroundColor: AppColors.kSurfaceColor,
                  child: CircleAvatar(
                    backgroundColor: AppColors.kSurfaceColor,
                    backgroundImage: CachedNetworkImageProvider(
                      CurrentUserData.personalPicture,
                    ),
                    radius: size.width * .16,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  textDirection: TextDirection.ltr,
                  '@${CurrentUserData.username}',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppStyle.kTextStyle20,
                    color: AppColors.kSurfaceColor,
                  ),
                ),
                const SizedBox(height: 20),
                BarcodeWidget(
                  padding: const EdgeInsets.all(8),
                  data: CurrentUserData.username,
                  barcode: Barcode.qrCode(),
                  backgroundColor: AppColors.kSurfaceColor,
                  height: size.width * .4,
                  width: size.width * .4,
                ),
                const SizedBox(height: 20),
                Text(
                  "Scan The Barcode".tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: AppStyle.kTextStyle20,
                    color: AppColors.kSurfaceColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
