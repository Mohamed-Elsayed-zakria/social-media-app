import '../../../controller/uploade_reels_controller.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VideoReelsDropDownMenu extends StatelessWidget {
  const VideoReelsDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> videoReelsListItem = [
      "Public".tr,
      "Following".tr,
      "Private".tr,
    ];
    uploadeReelsSelectItem.value = videoReelsListItem[0];
    return Obx(
      () => DropdownButtonHideUnderline(
        child: DropdownButton(
          value: uploadeReelsSelectItem.value,
          items: videoReelsListItem
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
          onChanged: (item) => uploadeReelsSelectItem.value = item!,
        ),
      ),
    );
  }
}
