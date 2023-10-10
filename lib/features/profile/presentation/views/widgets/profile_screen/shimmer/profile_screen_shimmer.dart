import '../../../../../../posts/presentation/views/widgets/custom_post/custom_post_shimmer.dart';
import 'profile_screen_count_followers_following_shimmer.dart';
import '../../../../../../../core/constant/colors.dart';
import 'profile_screen_username_fullname_shimmer.dart';
import 'profile_screen_current_user_shimmer.dart';
import 'package:flutter/material.dart';
import 'profile_screen_header_shimmer.dart';

class ProfileScreenShimmer extends StatelessWidget {
  const ProfileScreenShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: AppColors.kSurfaceColor,
        child: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProfileScreenHeaderShimmer(),
            ProfileScreenUsernameFullnameShimmer(),
            ProfileScreenCountFollowersFollowingShimmer(),
            ProfileScreenCurrentUserShimmer(),
            CustomPostShimmer(),
          ],
        ),
      ),
    );
  }
}
