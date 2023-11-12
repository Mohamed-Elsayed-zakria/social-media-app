import '../../../controller/show_reels_controller.dart';
import '../../../../data/model/reels_model.dart';
import '../../../../../../core/constant/colors.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnLongCurrentReels extends StatelessWidget {
  final ReelsModel allReels;

  const OnLongCurrentReels({
    super.key,
    required this.allReels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 75,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.kSurfaceColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
      ),
      child: Center(
        child: ListTile(
          onTap: () {
            Get.back();
            deleteReels(reelsUid: allReels.reelUid);
          },
          title: Text('Delete'.tr),
          leading: const Icon(
            color: AppColors.kPrimaryColor,
            IconlyBroken.delete,
          ),
        ),
      ),
    );
  }
}
