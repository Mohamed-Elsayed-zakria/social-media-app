import '../../../features/profile/presentation/views/profile_screen.dart';
import '../custom_verified_in_circal_avatar.dart';
import '../../model/comment_model.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import 'package:get/get.dart';

class CommentCircleAvatar extends StatelessWidget {
  final CommentModel commentData;
  const CommentCircleAvatar({
    super.key,
    required this.commentData,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.to(
        () => ProfileScreen(
          otherUid: commentData.personUid,
        ),
      ),
      child: Stack(
        children: [
          CircleAvatar(
            radius: 28,
            backgroundColor: AppColors.kBackgroundColor,
            backgroundImage: NetworkImage(
              commentData.personalPicture,
            ),
          ),
          CustomVerifiedInCircalAvatar(visible: commentData.verified),
        ],
      ),
    );
  }
}
