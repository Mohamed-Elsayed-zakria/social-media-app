import '../../../../../core/constant/colors.dart';
import '../../../data/models/user_chat_data.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';

class ChatUploadeLower extends StatelessWidget {
  final UserChatData userData;
  final Function() onPressed;
  const ChatUploadeLower({
    super.key,
    required this.userData,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: const Icon(IconlyBroken.send),
          style: const ButtonStyle(
            iconColor: MaterialStatePropertyAll(
              AppColors.kPrimaryColor,
            ),
          ),
          iconSize: 30,
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            textDirection: TextDirection.ltr,
            '@${userData.username}',
            style: const TextStyle(
              color: AppColors.kSurfaceColor,
              fontSize: AppStyle.kTextStyle16,
            ),
          ),
        ),
      ],
    );
  }
}
