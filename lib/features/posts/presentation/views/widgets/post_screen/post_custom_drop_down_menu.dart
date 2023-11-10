import '../../../controllers/post_screen_controller.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PostCustomDropDownMenu extends StatelessWidget {
  const PostCustomDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> listItem = [
      "Public".tr,
      "Following".tr,
      "Private".tr,
    ];
    selectItem.value = listItem[0];
    return Obx(
      () => DropdownButtonHideUnderline(
        child: DropdownButton(
          value: selectItem.value,
          items: listItem
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
          onChanged: (item) => selectItem.value = item!,
        ),
      ),
    );
  }
}
