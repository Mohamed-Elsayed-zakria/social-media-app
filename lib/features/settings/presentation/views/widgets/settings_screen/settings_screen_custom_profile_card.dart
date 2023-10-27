import '../../../../../profile/presentation/views/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/model/current_user_data.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsScreenCustomProfileCard extends StatelessWidget {
  const SettingsScreenCustomProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            Get.to(() => ProfileScreen(otherUid: ApiService.user.uid));
          },
          title: Row(
            children: [
              Text(
                textDirection: TextDirection.ltr,
                '@${CurrentUserData.username}',
                style: const TextStyle(
                  fontSize: AppStyle.kTextStyle18,
                ),
              ),
            ],
          ),
          subtitle: Text(
            "View Profile".tr,
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle18,
              color: AppColors.kPrimaryColor,
            ),
          ),
          leading: CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.kSurfaceColor,
            backgroundImage: CachedNetworkImageProvider(
              CurrentUserData.personalPicture,
            ),
          ),
          trailing: const Icon(IconlyBroken.arrowRight2),
        ),
        const SizedBox(height: 4),
      ],
    );
  }
}
