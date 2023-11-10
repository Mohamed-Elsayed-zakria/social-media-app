import 'package:flash/core/utils/size_screen.dart';
import 'package:flutter/material.dart';
import '../../constant/colors.dart';
import '../custom_buttom.dart';
import 'package:get/get.dart';
import 'dart:io';

class CommentUploadeImageShow extends StatelessWidget {
  final Function() onTapSendImage;
  final String imageUrl;
  const CommentUploadeImageShow({
    super.key,
    required this.imageUrl,
    required this.onTapSendImage,
  });

  @override
  Widget build(BuildContext context) {
    final size = sizeScreen(context: context);
    return Scaffold(
      backgroundColor: AppColors.kOnSurfaceColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: IconButton(
              onPressed: () => Get.back(),
              icon: const Icon(
                color: AppColors.kSurfaceColor,
                Icons.close_outlined,
                size: 28,
              ),
            ),
          ),
          LimitedBox(
            maxHeight: size.height * .6,
            child: Image.file(
              filterQuality: FilterQuality.high,
              File(imageUrl),
              width: double.infinity,
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
            width: size.width * .3,
            child: CustomButton(
              onPressed: onTapSendImage,
              text: "Send".tr,
            ),
          ),
        ],
      ),
    );
  }
}
