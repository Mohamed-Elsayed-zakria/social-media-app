import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import 'package:get/get.dart';

class CommentsLower extends StatelessWidget {
  final TextEditingController commentController;
  final Function() onTapSendComment;
  final Function() onTapSendImage;

  const CommentsLower({
    super.key,
    required this.onTapSendComment,
    required this.commentController,
    required this.onTapSendImage,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: onTapSendComment,
          icon: const Icon(IconlyBroken.send),
          style: const ButtonStyle(
            iconColor: MaterialStatePropertyAll(
              AppColors.kPrimaryColor,
            ),
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
                      controller: commentController,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        hintText: "Write comment".tr,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: onTapSendImage,
                  icon: const Icon(
                    IconlyBroken.image,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
