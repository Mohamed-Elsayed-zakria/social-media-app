import '../../../../data/model/reels_model.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import '../../../controller/show_reels_controller.dart';
import 'show_reels_buttom_sheet_comments.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ShowReelsCustomComments extends StatelessWidget {
  final ReelsModel allReels;

  const ShowReelsCustomComments({
    super.key,
    required this.allReels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        children: [
          IconButton(
            onPressed: () => Get.bottomSheet(
              ShowReelsButtomSheetComments(allReels: allReels),
              isScrollControlled: true,
            ),
            icon: const Icon(
              IconlyBroken.moreSquare,
              size: 33,
              color: AppColors.kSurfaceColor,
            ),
          ),
          StreamBuilder(
            stream: getCommentReelsCount(reelsUid: allReels.reelUid),
            builder: (context, snapshot) {
              int? countComments = 0;
              if (snapshot.hasData) {
                countComments = snapshot.data;
              }
              return Text(
                countComments.toString(),
                style: const TextStyle(
                  color: AppColors.kSurfaceColor,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
