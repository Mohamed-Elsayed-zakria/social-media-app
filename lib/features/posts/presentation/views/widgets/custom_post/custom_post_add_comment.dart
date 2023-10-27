import '../../../controllers/custom_post_controller.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../data/model/post_model.dart';
import 'package:flutter/material.dart';
import 'custom_post_details.dart';
import 'package:get/get.dart';

class CustomPostAddComment extends StatelessWidget {
  final PostModel postData;
  const CustomPostAddComment({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () => Get.to(
            () => CustomPostDetails(postUid: postData.postUid),
          ),
          icon: const Icon(IconlyBroken.moreSquare),
        ),
        StreamBuilder(
          stream: getCommentCount(postUid: postData.postUid),
          builder: (context, commentsSnapshot) {
            int commentsCount = 0;
            if (commentsSnapshot.hasData) {
              commentsCount = commentsSnapshot.data!;
            }
            return Text(commentsCount.toString());
          },
        ),
      ],
    );
  }
}
