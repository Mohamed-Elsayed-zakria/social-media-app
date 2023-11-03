import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/constant/style.dart';
import '../../../../data/models/profile_model.dart';
import '../../profile_all_followers_screen.dart';
import '../../profile_all_following_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenCountFollowingFollowers extends StatelessWidget {
  final ProfileScreenModel userData;

  const ProfileScreenCountFollowingFollowers({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        children: [
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () => Get.to(
                  () => ProfileAllFollowersScreen(
                    otherUid: userData.personalUid,
                  ),
                ),
                child: Column(
                  children: [
                    Text(
                      "${userData.followersCount}",
                      style: const TextStyle(
                        fontSize: AppStyle.kTextStyle16,
                      ),
                    ),
                    Text(
                      "Followers".tr,
                      style: const TextStyle(
                        fontSize: AppStyle.kTextStyle16,
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () => Get.to(() => ProfileAllFollowingScreen(
                      otherUid: userData.personalUid,
                    )),
                child: Column(
                  children: [
                    Text(
                      "${userData.followingCount}",
                      style: const TextStyle(fontSize: AppStyle.kTextStyle16),
                    ),
                    Text(
                      userData.personalUid == ApiService.user.uid
                          ? "Following".tr
                          : "Otherfollowing".tr,
                      style: const TextStyle(fontSize: AppStyle.kTextStyle16),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
