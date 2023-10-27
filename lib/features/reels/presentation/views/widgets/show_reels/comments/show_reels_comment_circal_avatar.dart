import '../../../../../../profile/presentation/views/profile_screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../../../../core/model/comment_model.dart';
import '../../../../../../../core/constant/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowReelsCommentCircleAvatar extends StatelessWidget {
  final CommentModel commentData;
  const ShowReelsCommentCircleAvatar({
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
      child: CircleAvatar(
        radius: 28,
        backgroundColor: AppColors.kBackgroundColor,
        backgroundImage: CachedNetworkImageProvider(
          commentData.personalPicture,
        ),
      ),
    );
  }
}
