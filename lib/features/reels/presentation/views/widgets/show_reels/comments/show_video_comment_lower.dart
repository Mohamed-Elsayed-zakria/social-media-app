import '../../../../../data/model/video_reels_model.dart';
import '../../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowVideoCommentsLower extends StatelessWidget {
  final VideoReelsModel allReels;

  const ShowVideoCommentsLower({
    super.key,
    required this.allReels,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.kSurfaceColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(IconlyBroken.send),
            style: const ButtonStyle(
              iconColor: MaterialStatePropertyAll(
                AppColors.kPrimaryColor,
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: "Write comment".tr,
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
