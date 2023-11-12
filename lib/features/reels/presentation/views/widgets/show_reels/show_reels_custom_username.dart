import '../../../../data/model/reels_model.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/style.dart';
import 'package:flutter/material.dart';

class ShowReelsCustomUsername extends StatelessWidget {
  final ReelsModel allReels;
  const ShowReelsCustomUsername({
    super.key,
    required this.allReels,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      child: Text(
        textDirection: TextDirection.ltr,
        "@${allReels.username}",
        style: const TextStyle(
          fontSize: AppStyle.kTextStyle16,
          color: AppColors.kSurfaceColor,
        ),
      ),
    );
  }
}
