import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../controllers/post_screen_controller.dart';
import 'post_custom_drop_down_menu.dart';
import 'package:flutter/material.dart';
import 'post_screen_buttom_sheet.dart';
import 'package:get/get.dart';

class PostScreenLower extends StatelessWidget {
  const PostScreenLower({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Get.bottomSheet(
                PostScreenButtomSheet(
                  onTapUploadeImage: () {
                    Get.back();
                    uploadeImage();
                  },
                  onTapUploadeVideo: () {
                    Get.back();
                    uploadeVideo();
                  },
                ),
              );
            },
            icon: const Icon(FontAwesomeIcons.paperclip),
          ),
          const PostCustomDropDownMenu(),
        ],
      ),
    );
  }
}
