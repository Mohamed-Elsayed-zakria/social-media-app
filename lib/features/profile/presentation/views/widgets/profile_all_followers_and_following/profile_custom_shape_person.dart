import '../../../../../../core/constant/style.dart';
import '../../../../data/models/profile_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../core/constant/colors.dart';
import '../../profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileCustomShapePerson extends StatelessWidget {
  final ProfileScreenModel followerData;
  const ProfileCustomShapePerson({
    super.key,
    required this.followerData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4),
      child: ListTile(
        onTap: () => Get.to(
          () => ProfileScreen(otherUid: followerData.personalUid),
        ),
        title: Text(
          textDirection: TextDirection.ltr,
          '@${followerData.username}',
          style: const TextStyle(
            fontSize: AppStyle.kTextStyle16,
          ),
        ),
        leading: Stack(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.kSurfaceColor,
              backgroundImage: CachedNetworkImageProvider(
                followerData.personalPicture,
              ),
              radius: 28,
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Visibility(
                visible: followerData.verified,
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.kSurfaceColor,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const Icon(
                    Icons.verified,
                    size: 18,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
