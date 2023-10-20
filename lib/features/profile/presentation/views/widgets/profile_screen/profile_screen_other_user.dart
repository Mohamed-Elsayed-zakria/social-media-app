import '../../../../../../core/api/api_service.dart';
import '../../../../../chats/data/models/user_chat_data.dart';
import '../../../../../chats/presentation/views/chat_screen_messages.dart';
import '../../../../data/models/profile_model.dart';
import '../../../controller/profile_screen_controller.dart';
import '../../../../../../core/widgets/custom_buttom.dart';
import '../../../../../../core/constant/constant.dart';
import 'profile_screen_other_more_buttom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreenOtherUser extends StatelessWidget {
  final ProfileScreenModel userData;
  final UserChatData userDataMessage;
  const ProfileScreenOtherUser({
    super.key,
    required this.userData,
    required this.userDataMessage,
  });

  @override
  Widget build(BuildContext context) {
    final size = Constant.sizeScreen(context: context);
    return Column(
      children: [
        const Divider(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Get.bottomSheet(
                  ProfileScreenOtherMoreButtom(
                    userData: userData,
                  ),
                );
              },
              icon: const Icon(
                Icons.more_vert_outlined,
              ),
            ),
            SizedBox(
              width: size.width * 0.33,
              child: CustomButton(
                onPressed: () {
                  Get.to(() => ChatScreenMessages(userData: userDataMessage));
                },
                text: "chat".tr,
              ),
            ),
            userData.followersList.contains(ApiService.user.uid)
                ? SizedBox(
                    width: size.width * 0.33,
                    child: CustomButton(
                      onPressed: () => tapUnfolow(userData: userData),
                      text: "unFolow".tr,
                    ),
                  )
                : SizedBox(
                    width: size.width * 0.33,
                    child: CustomButton(
                      onPressed: () => tapFolow(userData: userData),
                      text: "Folow".tr,
                    ),
                  ),
          ],
        ),
        const Divider(height: 6),
      ],
    );
  }
}
