import '../../../controllers/chat_screen_messages_controller.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../data/models/user_chat_data.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'custom_buttom_sheet_take_photo_vedio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLowerSentMessage extends StatelessWidget {
  final UserChatData userData;
  const CustomLowerSentMessage({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            if (getMessageChat.text.isNotEmpty) {
              sentNewMessageOfTypeText(
                text: getMessageChat.text,
                userData: userData,
              );
            }
          },
          icon: const Icon(
            color: AppColors.kPrimaryColor,
            IconlyBroken.send,
          ),
        ),
        Expanded(
          child: Card(
            color: AppColors.kSurfaceColor,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: TextFormField(
                      controller: getMessageChat,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: 'Type your Message here'.tr,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      onPressed: () {
                        Get.bottomSheet(
                          CustomButtomSheetTakePhotoVedio(
                            onTapUploadeImage: () {
                              Get.back();
                              chatUploadeImageFromGalary(userData: userData);
                            },
                            onTapUploadeVedio: () {
                              Get.back();
                              addVideoChatOpenGalary(userData: userData);
                            },
                          ),
                        );
                      },
                      icon: const Icon(
                        color: Colors.black54,
                        FontAwesomeIcons.paperclip,
                        size: 20,
                      ),
                    ),
                    IconButton(
                      onPressed: () => chatUploadeImageFromCamera(
                        userData: userData,
                      ),
                      icon: const Icon(
                        color: Colors.black54,
                        Icons.camera_alt_outlined,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
