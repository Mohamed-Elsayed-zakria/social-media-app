import '../../../../../../core/api/api_service.dart';
import '../../../../../chats/data/models/user_chat_data.dart';
import '../../../../../posts/presentation/views/widgets/custom_post/custom_post.dart';
import '../../../controller/profile_screen_controller.dart';
import 'profile_screen_current_user.dart';
import 'profile_screen_other_user.dart';
import 'profile_screen_username_fullname_verified.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../data/models/profile_model.dart';
import 'profile_count_following_followers.dart';
import 'profile_screen_cover_person_image.dart';
import 'shimmer/profile_screen_shimmer.dart';
import 'package:flutter/material.dart';
import 'profile_screen_bio.dart';

class ProfileScreenBody extends StatelessWidget {
  final String otherUid;
  const ProfileScreenBody({
    super.key,
    required this.otherUid,
  });

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
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
              stream: getDataToProfileScreen(otherUid: otherUid),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const ProfileScreenShimmer();
                } else {
                  ProfileScreenModel userData;
                  UserChatData userDataMessage;
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  userData = ProfileScreenModel.fromJson(data);
                  userDataMessage = UserChatData.fromJson(data);

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
                          ? ProfileScreenCurrentUser(
                              userData: userData,
                            )
                          : ProfileScreenOtherUser(
                              userData: userData,
                              userDataMessage: userDataMessage,
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
        ),
        CustomPost(
          future: getPostsForSpecificPerson(
            otherUid: otherUid,
          ),
        )
      ],
    );
  }
}
