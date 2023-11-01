import '../../../../../../../core/widgets/custom_form_field.dart';
import '../../../../controllers/comments_controller.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import '../../../../../../../core/model/comment_model.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnLongPressCurrentComment extends StatelessWidget {
  final CommentModel commentData;
  final String postUid;

  const OnLongPressCurrentComment({
    super.key,
    required this.commentData,
    required this.postUid,
  });

  @override
  Widget build(BuildContext context) {
    getTextComment.text = commentData.textComment;
    return Container(
      width: double.infinity,
      height: 140,
      decoration: const BoxDecoration(
        color: AppColors.kSurfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () async {
              await deleteComment(
                commentUid: commentData.commentId,
                postUid: postUid,
              );
              Get.back();
            },
            title: Text('Delete comment'.tr),
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              IconlyBroken.delete,
            ),
          ),
          ListTile(
            onTap: () {
              Get.back();
              Get.defaultDialog(
                backgroundColor: AppColors.kSurfaceColor,
                titlePadding: const EdgeInsets.only(top: 20),
                title: "Edite".tr,
                confirm: TextButton(
                  onPressed: () async {
                    if (getTextComment.text.isNotEmpty) {
                      Get.back();
                      updateComment(
                        newTextComment: getTextComment.text,
                        commentUid: commentData.commentId,
                        postUid: postUid,
                      );
                    }
                  },
                  child: Text(
                    "Edite".tr,
                    style: const TextStyle(fontSize: AppStyle.kTextStyle16),
                  ),
                ),
                content: Container(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: CustomFormField(
                      controller: getTextComment,
                      keyboardType: TextInputType.multiline,
                      label: "Edite comment".tr,
                      hintText: "Write comment".tr,
                    ),
                  ),
                ),
              );
            },
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              IconlyBroken.edit,
            ),
            title: Text(
              "Edite comment".tr,
              style: const TextStyle(fontSize: AppStyle.kTextStyle18),
            ),
          ),
        ],
      ),
    );
  }
}
