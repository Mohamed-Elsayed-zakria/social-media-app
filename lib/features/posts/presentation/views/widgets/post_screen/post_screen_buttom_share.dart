import '../../../controllers/post_screen_controller.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostScreenButtomShare extends StatelessWidget {
  const PostScreenButtomShare({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Obx(
        () => TextButton(
          onPressed: addPostLoading.value == false
              ? () {
                  if (addPostFormKey.currentState!.validate()) {
                    createNewPost(
                      postStatus: selectItem.value,
                      description: getDescriptionText.text,
                    );
                  }
                }
              : null,
          child: Text(
            'Share'.tr,
            style: const TextStyle(
              fontSize: AppStyle.kTextStyle18,
            ),
          ),
        ),
      ),
    );
  }
}
