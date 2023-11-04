import '../../../../controllers/custom_post_controller.dart';
import '../../../../../../../core/constant/colors.dart';
import '../../../../../../../core/constant/style.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../data/model/post_model.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../update_post_screen.dart';
import 'custom_post_more_all_likes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomPostMoreCurrentUser extends StatelessWidget {
  final PostModel postData;

  const CustomPostMoreCurrentUser({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,
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
              await deletePost(data: postData);
              Fluttertoast.showToast(
                msg: "The Post has been deleted".tr,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
              );
              Get.back();
            },
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              IconlyBroken.delete,
            ),
            title: Text(
              "Deletet the Post".tr,
              style: const TextStyle(fontSize: 18),
            ),
          ),
          ListTile(
            onTap: () => Get.off(() => UpdatePostScreen(postData: postData)),
            leading: const Icon(
              color: AppColors.kPrimaryColor,
              IconlyBroken.edit,
            ),
            title: Text(
              "Edite post".tr,
              style: const TextStyle(fontSize: AppStyle.kTextStyle18),
            ),
          ),
          CustomPostMoreAllLikes(postUid: postData.postUid),
        ],
      ),
    );
  }
}
