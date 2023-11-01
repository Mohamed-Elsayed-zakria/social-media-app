import '../../../controllers/chat_screen_messages_controller.dart';
import '../../../../data/models/user_chat_data.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../data/models/message_model.dart';
import '../chat_custom_icon_buttom_close.dart';
import 'package:flutter/material.dart';
import '../chat_uploade_lower.dart';
import 'package:get/get.dart';
import 'dart:io';

class ChatUplaodeImagesBody extends StatelessWidget {
  final UserChatData userData;

  const ChatUplaodeImagesBody({
    super.key,
    required this.userData,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const ChatCustomIconButtomClose(),
        Expanded(
          child: Obx(
            () => Stack(
              children: [
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: PageView.builder(
                    onPageChanged: (value) => imageIndex.value = value,
                    itemCount: chatImagePaths.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) => Image.file(
                      filterQuality: FilterQuality.high,
                      File(chatImagePaths[index]),
                      width: double.infinity,
                      // fit: BoxFit.fill,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () => chatRemoveImage(imageIndex.value),
                  icon: const Icon(
                    color: AppColors.kPrimaryColor,
                    IconlyBroken.delete,
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ),
        ChatUploadeLower(
          userData: userData,
          onPressed: () {
            Get.back();
            if (chatImagePaths.isNotEmpty) {
              sentNewMessage(
                type: TypeChatMessage.image.name,
                userData: userData,
                text: '',
              );
            }
          },
        ),
      ],
    );
  }
}
