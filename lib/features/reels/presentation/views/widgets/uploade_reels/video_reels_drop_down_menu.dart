import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../core/constant/style.dart';
import '../../../controller/uploade_reels_controller.dart';

class VideoReelsDropDownMenu extends StatelessWidget {
  const VideoReelsDropDownMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => DropdownButtonHideUnderline(
        child: DropdownButton(
          value: selectItem.value,
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
          onChanged: (item) => selectItem.value = item!,
        ),
      ),
    );
  }
}
