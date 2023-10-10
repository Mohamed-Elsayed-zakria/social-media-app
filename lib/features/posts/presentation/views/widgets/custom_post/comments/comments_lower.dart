import 'package:get/get.dart';
import 'package:icon_broken/icon_broken.dart';

import '../../../../../../../core/constant/colors.dart';
import '../../../../controllers/comments_controller.dart';
import 'package:flutter/material.dart';

class CommentsLower extends StatelessWidget {
  final String postId;

  const CommentsLower({
    super.key,
    required this.postId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kSurfaceColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {
              if (commentController.text.isNotEmpty) {
                addNewComment(
                  text: commentController.text,
                  postId: postId,
                );
              }
            },
            icon: const Icon(IconBroken.Send),
            style: const ButtonStyle(
              iconColor: MaterialStatePropertyAll(
                AppColors.kPrimaryColor,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: commentController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Write comment".tr,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
