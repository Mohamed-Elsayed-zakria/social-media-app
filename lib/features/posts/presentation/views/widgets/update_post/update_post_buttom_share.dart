import '../../../controllers/update_post_controller.dart';
import '../../../../../../core/constant/style.dart';
import '../../../../data/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePostButtomShare extends StatelessWidget {
  final PostModel postData;

  const UpdatePostButtomShare({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Obx(
        () => TextButton(
          onPressed: updatePostLoading.value != true
              ? () {
                  if (updatePostFormKey.currentState!.validate()) {
                    updatePost(
                      postUid: postData.postUid,
                      postStatus: updatePostSelectItem.value,
                    );
                  }
                }
              : null,
          child: Text(
            'update'.tr,
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle18,
            ),
          ),
        ),
      ),
    );
  }
}
