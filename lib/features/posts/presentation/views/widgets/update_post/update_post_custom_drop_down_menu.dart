import '../../../controllers/update_post_controller.dart';
import '../../../../../../core/constant/style.dart';
import '../../../../data/model/post_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdatePostCustomDropDownMenu extends StatelessWidget {
  final PostModel postData;

  const UpdatePostCustomDropDownMenu({
    super.key,
    required this.postData,
  });

  @override
  Widget build(BuildContext context) {
    List<String> updatePostListItem = [
      "Public".tr,
      "Following".tr,
      "Private".tr,
    ];
    updatePostSelectItem.value = postData.postStatus.tr;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Obx(
        () => DropdownButtonHideUnderline(
          child: DropdownButton(
            value: updatePostSelectItem.value,
            items: updatePostListItem
                .map(
                  (item) => DropdownMenuItem(
                    value: item,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      child: Text(
                        item,
                        style: const TextStyle(
                          fontSize: AppStyle.kTextStyle18,
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (item) => updatePostSelectItem.value = item!,
          ),
        ),
      ),
    );
  }
}
