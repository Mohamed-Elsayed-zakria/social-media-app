import '../../../../controller/show_reels_comments_controller.dart';
import '../../../../../../../core/widgets/custom_form_field.dart';
import '../../../../../../../core/model/comment_model.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowReelsOnLongPressCurrentComment extends StatelessWidget {
  final CommentModel commentData;
  final String videoUid;

  const ShowReelsOnLongPressCurrentComment({
    super.key,
    required this.commentData,
    required this.videoUid,
  });

  @override
  Widget build(BuildContext context) {
    getTextReelsComment.text = commentData.textComment;
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
              await deleteReelsComment(
                commentUid: commentData.commentId,
                videoUid: videoUid,
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
                    if (getTextReelsComment.text.isNotEmpty) {
                      await updateReelsComment(
                        newTextComment: getTextReelsComment.text,
                        commentUid: commentData.commentId,
                        videoUid: videoUid,
                      );
                      Get.back();
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
                      controller: getTextReelsComment,
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
