import 'package:flutter/material.dart';
import '../../../../../../core/constant/colors.dart';
import '../../../../../../core/constant/constant.dart';

class VideoReelsCustomCircleAvatar extends StatelessWidget {
  const VideoReelsCustomCircleAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Stack(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: AppColors.kSurfaceColor,
            child: CircleAvatar(
              radius: 28,
              backgroundColor: AppColors.kSurfaceColor,
              backgroundImage: NetworkImage(Constant.urlPhotoMale),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Visibility(
              visible: true,
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.kSurfaceColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: const Icon(
                  Icons.verified,
                  size: 18,
                  color: AppColors.kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
