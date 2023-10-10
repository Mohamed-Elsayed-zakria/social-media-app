import '../../../controllers/custom_post_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../data/model/post_model.dart';
import 'package:flutter/material.dart';
import 'custom_post_content.dart';
import 'custom_post_lower.dart';
import 'custom_post_header.dart';

class CustomPostItem extends StatelessWidget {
  final PostModel postData;
  final bool detailsPage;
  const CustomPostItem({
    super.key,
    required this.postData,
    required this.detailsPage,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: getPostComments(postUid: postData.postUid),
      builder: (context, commentsSnapshot) {
        int commentsCount = 0;
        if (commentsSnapshot.hasData) {
          commentsCount = commentsSnapshot.data!.docs.length;
        }
        return StreamBuilder<QuerySnapshot>(
          stream: getPostLikes(postUid: postData.postUid),
          builder: (context, likesSnapshot) {
            List<Map<String, dynamic>> likesData = [];
            List allLikes = [];
            if (likesSnapshot.hasData) {
              likesData = likesSnapshot.data!.docs
                  .map((likeDoc) => likeDoc.data() as Map<String, dynamic>)
                  .toList();
              allLikes = likesData.map((like) => like['personUid']).toList();
            }

            Widget postContent = Column(
              children: [
                CustomPostHeader(postData: postData),
                CustomPostContent(postData: postData),
                CustomPostLower(
                  countComments: commentsCount,
                  allLikes: allLikes,
                  postData: postData,
                ),
              ],
            );

            return detailsPage
                ? Container(
                    color: AppColors.kSurfaceColor,
                    child: postContent,
                  )
                : Card(
                    color: AppColors.kSurfaceColor,
                    child: postContent,
                  );
          },
        );
      },
    );
  }
}
