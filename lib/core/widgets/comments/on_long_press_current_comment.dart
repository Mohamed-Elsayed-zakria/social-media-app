import 'package:flutter_iconly/flutter_iconly.dart';
import '../../model/comment_model.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../../constant/style.dart';
import '../custom_form_field.dart';
import 'package:get/get.dart';

class OnLongPressCurrentComment extends StatelessWidget {
  final TextEditingController commentController;
  final CommentModel commentData;
  final Function() onTapDelete;
  final Function() onTapEdite;

  const OnLongPressCurrentComment({
    super.key,
    required this.commentController,
    required this.commentData,
    required this.onTapDelete,
    required this.onTapEdite,
  });

  @override
  Widget build(BuildContext context) {
    commentController.text = commentData.textComment;
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
            onTap: onTapDelete,
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
                  onPressed: onTapEdite,
                  child: Text(
                    "Edite".tr,
                    style: const TextStyle(fontSize: AppStyle.kTextStyle16),
                  ),
                ),
                content: Container(
                  padding: const EdgeInsets.all(10),
                  child: Center(
                    child: CustomFormField(
                      controller: commentController,
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
