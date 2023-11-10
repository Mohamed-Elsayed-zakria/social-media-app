import '../../../../../chats/data/models/user_chat_data.dart';
import '../../../controller/profile_screen_controller.dart';
import 'profile_screen_username_fullname_verified.dart';
import '../../../../../../core/api/api_service.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../data/models/profile_model.dart';
import 'profile_count_following_followers.dart';
import 'profile_screen_cover_person_image.dart';
import 'shimmer/profile_screen_shimmer.dart';
import 'profile_screen_current_user.dart';
import 'profile_screen_other_user.dart';
import 'package:flutter/material.dart';
import 'profile_screen_bio.dart';

class ProfileScreenHeader extends StatelessWidget {
  final String otherUid;
  const ProfileScreenHeader({
    super.key,
    required this.otherUid,
  });

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.kSurfaceColor,
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(14),
            bottomRight: Radius.circular(14),
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.kOnSurfaceColor.withOpacity(0.1),
              offset: const Offset(0, 2),
              blurRadius: 5,
            ),
          ],
        ),
        child: StreamBuilder(
          stream: getCurrentUserData(otherUid: otherUid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const ProfileScreenShimmer();
            } else {
              ProfileScreenModel userData =
                  ProfileScreenModel.fromJson(snapshot.data!);
              UserChatData userDataMessage =
                  UserChatData.fromJson(snapshot.data!);
              return Column(
                children: [
                  ProfileScreenCoverAndPersonImage(
                    userData: userData,
                  ),
                  ProfileScreenUsernameAndFullnameAndVerified(
                    userData: userData,
                  ),
                  ProfileScreenCountFollowingFollowers(
                    userData: userData,
                  ),
                  ApiService.user.uid == userData.personalUid
                      ? ProfileScreenCurrentUser(userData: userData)
                      : ProfileScreenOtherUser(
                          userDataMessage: userDataMessage,
                          userData: userData,
                        ),
                  ProfileScreenBio(
                    textBio: userData.bio,
                  ),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
