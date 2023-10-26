import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import '../../../../../data/model/comment_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../controllers/comments_controller.dart';

class OnLongPressOtherComment extends StatelessWidget {
  final CommentModel commentData;
  final String postUid;

  const OnLongPressOtherComment({
    super.key,
    required this.commentData,
    required this.postUid,
  });

  @override
  Widget build(BuildContext context) {
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
              await reportComment(
                commentData: commentData,
                postUid: postUid,
              );
              Get.back();
              Fluttertoast.showToast(
                msg: "The comment has been reported".tr,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
            },
            title: Text(
              "Report".tr,
              style: const TextStyle(fontSize: AppStyle.kTextStyle18),
            ),
            leading: const Icon(
              IconlyBroken.infoSquare,
              color: AppColors.kPrimaryColor,
            ),
          ),
          ListTile(
            onTap: () {
              Get.back();
              Clipboard.setData(ClipboardData(text: commentData.textComment));
              Fluttertoast.showToast(
                msg: "The text has been copied".tr,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
            },
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              Icons.copy_all_outlined,
            ),
            title: Text(
              "Copy text".tr,
              style: const TextStyle(fontSize: AppStyle.kTextStyle18),
            ),
          ),
        ],
      ),
    );
  }
}
